// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

var names = <String>[
  'Jane',
  'John',
  'Mary',
  'Marie',
  'Don',
  'Hello, John. I will be in town tomorrow.',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var nameList = names
      .map((n) => Text(
            n,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0, left: 8.0),
      child: Column(
        children: nameList,
      ),
    );
  }
}
