import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_widget_marquee/custom_widget_marquee.dart';

void main() {
  group('CustomWidgetMarquee', () {
    testWidgets('renders child widget correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomWidgetMarquee(
              autoRepeat: false,
              animationDuration: const Duration(seconds: 1),
              pauseDuration: const Duration(milliseconds: 100),
              backDuration: const Duration(seconds: 1),
              child: const Text('Marquee Content'),
            ),
          ),
        ),
      );

      expect(find.text('Marquee Content'), findsOneWidget);
      await tester.pump(const Duration(seconds: 5)); // Clear timers
    });

    testWidgets('applies custom properties (textDirection, direction)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomWidgetMarquee(
              autoRepeat: false,
              direction: Axis.vertical,
              textDirection: TextDirection.rtl,
              animationDuration: const Duration(seconds: 1),
              pauseDuration: const Duration(milliseconds: 100),
              backDuration: const Duration(seconds: 1),
              child: const Text('Vertical RTL Marquee'),
            ),
          ),
        ),
      );

      expect(find.text('Vertical RTL Marquee'), findsOneWidget);

      final singleChildScrollView = tester.widget<SingleChildScrollView>(
        find.descendant(
          of: find.byType(CustomWidgetMarquee),
          matching: find.byType(SingleChildScrollView),
        ),
      );
      expect(singleChildScrollView.scrollDirection, Axis.vertical);

      final directionality = tester.widget<Directionality>(
        find.descendant(
          of: find.byType(CustomWidgetMarquee),
          matching: find.byType(Directionality),
        ),
      );
      expect(directionality.textDirection, TextDirection.rtl);

      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('scrolls automatically in twoDirection mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100, // Constrain width to force scrolling
              child: CustomWidgetMarquee(
                animationDuration: const Duration(seconds: 1),
                backDuration: const Duration(seconds: 1),
                pauseDuration: const Duration(milliseconds: 100),
                directionOption: DirectionOption.twoDirection,
                autoRepeat: false,
                child: Container(width: 500, height: 50, color: Colors.red),
              ),
            ),
          ),
        ),
      );

      // Initially at offset 0
      final ScrollableState scrollable = tester.state(
        find.descendant(
          of: find.byType(CustomWidgetMarquee),
          matching: find.byType(Scrollable),
        ),
      );
      expect(scrollable.position.pixels, 0.0);

      // Wait out the first pause (100ms)
      await tester.pump(const Duration(milliseconds: 100));

      // Wait for the forward animation to finish
      await tester.pumpAndSettle();

      expect(scrollable.position.pixels, greaterThan(0.0));

      // Wait out second pause (100ms)
      await tester.pump(const Duration(milliseconds: 100));

      // Wait for the backward animation to finish
      await tester.pumpAndSettle();

      expect(scrollable.position.pixels, 0.0);
    });

    testWidgets('scrolls automatically in oneDirection mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              child: CustomWidgetMarquee(
                animationDuration: const Duration(seconds: 1),
                backDuration: const Duration(seconds: 1),
                pauseDuration: const Duration(milliseconds: 100),
                directionOption: DirectionOption.oneDirection,
                autoRepeat: false,
                child: Container(width: 500, height: 50, color: Colors.blue),
              ),
            ),
          ),
        ),
      );

      final ScrollableState scrollable = tester.state(
        find.descendant(
          of: find.byType(CustomWidgetMarquee),
          matching: find.byType(Scrollable),
        ),
      );
      expect(scrollable.position.pixels, 0.0);

      // Wait out first pause
      await tester.pump(const Duration(milliseconds: 100));

      // Forward animation
      await tester.pumpAndSettle();

      expect(scrollable.position.pixels, greaterThan(0.0));

      // Wait out second pause
      await tester.pump(const Duration(milliseconds: 100));

      // oneDirection jumps to 0 immediately when backward section hits
      // Since jumpTo(0.0) is not an animation, pumpAndSettle might just finish immediately.
      await tester.pumpAndSettle();

      expect(scrollable.position.pixels, 0.0);
    });
  });
}
