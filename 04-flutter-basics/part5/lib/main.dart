import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = <Color>[
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.yellow,
    ];

    var w = 100.0;
    var h = 100.0;
    var boxes = colors
        .map((c) => Container(
              color: c,
              width: w,
              height: h,
            ))
        .toList();

    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: boxes,
      ),
    );
  }
}
