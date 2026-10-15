import 'package:flutter/material.dart';
import 'package:custom_widget_marquee/custom_widget_marquee.dart';

void main() {
  runApp(const ExampleApp());
}

/// Example application demonstrating [CustomWidgetMarquee].
class ExampleApp extends StatelessWidget {
  /// Creates an instance of [ExampleApp].
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widget Marquee Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MarqueeDemoPage(),
    );
  }
}

/// Demo page displaying various marquee configurations.
class MarqueeDemoPage extends StatefulWidget {
  /// Creates an instance of [MarqueeDemoPage].
  const MarqueeDemoPage({super.key});

  @override
  State<MarqueeDemoPage> createState() => _MarqueeDemoPageState();
}

class _MarqueeDemoPageState extends State<MarqueeDemoPage> {
  final List<String> _textList = [
    'Flutter',
    'Custom Widget Marquee',
    'Bi-directional Scrolling',
    'Single Direction Scrolling',
    'Custom Speed & Curves',
  ];

  final List<Color> _colorList = [
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.amber,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widget Marquee Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bi-Directional Text Marquee',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomWidgetMarquee(
              animationDuration: const Duration(seconds: 10),
              backDuration: const Duration(seconds: 10),
              pauseDuration: const Duration(seconds: 1),
              directionOption: DirectionOption.twoDirection,
              child: Row(
                children: _textList.map((text) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.deepPurple.shade200),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Single Direction Colored Cards Marquee',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomWidgetMarquee(
              animationDuration: const Duration(seconds: 12),
              pauseDuration: const Duration(milliseconds: 500),
              directionOption: DirectionOption.oneDirection,
              child: Row(
                children: List.generate(_colorList.length, (index) {
                  return Container(
                    width: 120,
                    height: 90,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: _colorList[index],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Card ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
