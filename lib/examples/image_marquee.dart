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
