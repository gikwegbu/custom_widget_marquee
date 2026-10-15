import 'package:flutter/material.dart';

/// Defines the scrolling direction behavior for [CustomWidgetMarquee].
enum DirectionOption {
  /// Scrolls forward to the end and then jumps back to the start.
  oneDirection,

  /// Scrolls forward to the end and then animates backward to the start.
  twoDirection,
}

/// A widget that transforms any [child] widget into a customizable scrollable marquee.
class CustomWidgetMarquee extends StatelessWidget {
  /// The widget wrapped inside the scrollable marquee.
  final Widget child;

  /// The text directionality applied to the marquee content.
  final TextDirection textDirection;

  /// The axis direction in which the marquee scrolls.
  final Axis direction;

  /// The duration of the forward scrolling animation.
  final Duration animationDuration;

  /// The duration of the backward scrolling animation when [directionOption]
  /// is set to [DirectionOption.twoDirection].
  final Duration backDuration;

  /// The duration to pause before beginning and between directional scroll animations.
  final Duration pauseDuration;

  /// The scrolling behavior option, either single direction or bi-directional.
  final DirectionOption directionOption;

  /// The animation curve applied during forward scrolling.
  final Curve forwardAnimation;

  /// The animation curve applied during backward scrolling.
  final Curve backwardAnimation;

  /// Whether the marquee animation should repeat indefinitely.
  final bool autoRepeat;

  /// Creates a [CustomWidgetMarquee] widget.
  CustomWidgetMarquee({
    super.key,
    required this.child,
    this.direction = Axis.horizontal,
    this.textDirection = TextDirection.ltr,
    this.animationDuration = const Duration(seconds: 10),
    this.backDuration = const Duration(seconds: 10),
    this.pauseDuration = const Duration(seconds: 2),
    this.directionOption = DirectionOption.twoDirection,
    this.forwardAnimation = Curves.linear,
    this.backwardAnimation = Curves.linear,
    this.autoRepeat = true,
  });

  final ScrollController _sCtrl = ScrollController();

  /// Starts the marquee scroll animation loop.
  ///
  /// If [repeated] is true and [autoRepeat] is enabled, the animation will continue looping.
  Future<void> scroll(bool repeated) async {
    do {
      if (_sCtrl.hasClients) {
        await Future.delayed(pauseDuration);
        if (_sCtrl.hasClients) {
          await _sCtrl.animateTo(
            _sCtrl.position.maxScrollExtent,
            duration: animationDuration,
            curve: forwardAnimation,
          );
        }
        await Future.delayed(pauseDuration);
        if (_sCtrl.hasClients) {
          switch (directionOption) {
            case DirectionOption.oneDirection:
              _sCtrl.jumpTo(
                0.0,
              );
              break;
            case DirectionOption.twoDirection:
              await _sCtrl.animateTo(
                0.0,
                duration: backDuration,
                curve: backwardAnimation,
              );
              break;
          }
        }
        repeated = autoRepeat;
      } else {
        await Future.delayed(pauseDuration);
      }
    } while (repeated);
  }

  @override
  Widget build(BuildContext context) {
    bool repeated = true;
    scroll(repeated);
    return Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        scrollDirection: direction,
        controller: _sCtrl,
        child: child,
      ),
    );
  }
}
