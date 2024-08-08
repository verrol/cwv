import 'package:flutter/material.dart';

void main() {
  runApp(build());
}

Widget build() {
  var name = 'Verrol Adams';

  var text = Text(
    'Hello, world. My name is $name.',
    textDirection: TextDirection.ltr,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red,
      backgroundColor: Colors.yellow,
    ),
  );

  var text2 = const Text.rich(
    TextSpan(
      text: 'Hello', // default text style
      children: <TextSpan>[
        TextSpan(
            text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
        TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
    textDirection: TextDirection.ltr,
  );

  return Center(
    child: text2,
  );
}
