import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            MyImage(name: 'assets/images/image2.jpg'),
            MyImage(name: 'assets/images/image7.jpg'),
          ],
        ),
        MyImage(name: 'assets/images/image1.jpg'),
        MyImage(name: 'assets/images/image3.jpg'),
        Row(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            MyImage(name: 'assets/images/image4.jpg'),
          ],
        ),
        MyImage(name: 'assets/images/image5.jpg'),
        MyImage(name: 'assets/images/image6.jpg'),
        MyImage(name: 'assets/images/image8.jpg'),
        Row(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            MyImage(name: 'assets/images/image9.jpg'),
            MyImage(name: 'assets/images/image10.jpg'),
          ],
        ),
      ],
    );
  }
}

class MyImage extends StatelessWidget {
  final String name;

  MyImage({this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(name),
    );
  }
}
