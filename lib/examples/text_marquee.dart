import 'package:flutter/material.dart';
import 'package:custom_widget_marquee/src/custom_widget_marquee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Marquee Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Text Marquee'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          child: Column(
            children: [
              CustomWidgetMarquee(
                animationDuration: const Duration(seconds: 40),
                backDuration: const Duration(seconds: 40),
                pauseDuration: const Duration(seconds: 2),
                directionOption: DirectionOption.twoDirection,
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(
                      _textList.length,
                      (index) => Text(
                        _textList[index],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomWidgetMarquee(
                animationDuration: const Duration(seconds: 40),
                backDuration: const Duration(seconds: 40),
                pauseDuration: const Duration(seconds: 2),
                directionOption: DirectionOption.twoDirection,
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(
                      _textList.length,
                      (index) => Text(
                        _textList[index],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _textList = [
    "Hello George ",
    "Thanks for building this ",
    "It'll surely come in handy ",
    "Suprisingly, any widget I add here will get automatically marqueed "
  ];
}
