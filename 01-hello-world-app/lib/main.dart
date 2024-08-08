import 'package:flutter/material.dart';

void main() {
  runApp(Screen1());
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello, world!',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Text(
            'This is cool...',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Container(
            height: 40.0,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
