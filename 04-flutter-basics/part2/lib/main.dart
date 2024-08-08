import 'package:flutter/material.dart';
import 'widgets/my_text_widget.dart';

void main() {
  runApp(MyColumnTextWidget());
}

class MyColumnTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyTextWidget('Hi, Verrol Adams!'),
        MyTextWidget('Flutter is really cool.'),
        MyTextWidget('What a nice day to be coding.'),
        MyTextWidget(
          'Today is a great day.',
          color: Colors.green,
        ),
      ],
    );
  }
}
