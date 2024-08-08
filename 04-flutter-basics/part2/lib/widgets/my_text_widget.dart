import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String name;
  final Color color;

  MyTextWidget(this.name, {this.color});

  @override
  Widget build(BuildContext context) {
    var text1 = Text(
      name,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );

    return Center(
      child: text1,
    );
  }
}
