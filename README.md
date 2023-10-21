## WidgetMarquee

This is a simple package that gives you the power to turn any Flutter Widget into a `Marquee`. With this, you can further control the speed and also allows for manual `swiping gestures`.

## Outputs

- For Image Marquee


![Widget Image Marquee](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/p3mdfper4yycua0sn8hm.gif)

- For Text Marquee


![Widget Text Marquee](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/nhthscpjwlyihb3kaooh.gif)


## Features

- A `child` widget param that can accommodate any flutter or custom widget.

- A `TextDirection` param that allows you control the `Directionality` of the `child`.

- An `Axis` direction to enable you control the scroll direction for the `singleChildScrollView` wrapper for the `child`.

- A `Duration` controller, for the `animationDuration`, `backDuration` and the `pauseDuration` of the Marquee.

- A `Curve`parametric animation controller to adjust the rate of change of an animation over time for the `forwardAnimation` and `backwardAnimation`.

- An `autoRepeat` boolean value, to control the looping of the Marquee.


## Get Started

In the `pubspec.yaml` of your flutter project, add the following to your dependency;

```dart
dependencies:
  widget_marquee: <latest_version>
```
In the file you may wish to implement this Marquee

```dart
import 'package:widget_marquee/widget_marquee.dart';
```


## Basic Usage

```dart
    WidgetMarquee(
        animationDuration: const Duration(seconds: 20),
        backDuration: const Duration(seconds: 20),
        pauseDuration: const Duration(seconds: 2),
        directionOption: DirectionOption.twoDirection,
        child: SizedBox( // Can accept any Widget
            height: 100,
            child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(
                _imageList.length,
                (index) => Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                    _imageList[index],
                    fit: BoxFit.cover,
                    ),
                ),
                ),
            ),
            ),
        ),
    ),
```


## Example

- For Widget Image Marquee
```dart
import 'package:flutter/material.dart';
import 'package:widget_marquee/src/widget_marquee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          title: const Text('Widget Image Marquee'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          child: Column(
            children: [
              WidgetMarquee(
                animationDuration: const Duration(seconds: 20),
                backDuration: const Duration(seconds: 20),
                pauseDuration: const Duration(seconds: 2),
                directionOption: DirectionOption.twoDirection,
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(
                      _imageList.length,
                      (index) => Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _imageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetMarquee(
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
                      _imageList.length,
                      (index) => Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            _imageList[index],
                            fit: BoxFit.cover,
                          ),
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

  final List<String> _imageList = [
    "https://images.pexels.com/photos/11828990/pexels-photo-11828990.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/11828984/pexels-photo-11828984.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load"
        "https://images.pexels.com/photos/11828983/pexels-photo-11828983.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/4491624/pexels-photo-4491624.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/3986675/pexels-photo-3986675.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/3986672/pexels-photo-3986672.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/2932479/pexels-photo-2932479.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
  ];
}

```


- For Widget Text Marquee
```dart
import 'package:flutter/material.dart';
import 'package:widget_marquee/src/widget_marquee.dart';

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
              WidgetMarquee(
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
                        style: TextStyle(
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
              WidgetMarquee(
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
                        style: TextStyle(
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

```


## Additional information

You can find the example code [here](https://github.com/gikwegbu/widget_marquee/tree/main/lib/examples)