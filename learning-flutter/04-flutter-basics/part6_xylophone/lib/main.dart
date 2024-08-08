import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

final AudioCache player = AudioCache();

final keyColors = <Color>[
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.black,
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraint) {
          var maxWidth = constraint.maxWidth / (keyColors.length + 2);

          var w = maxWidth - (maxWidth * 0.3);
          var h = 200.0;
          var i = 5;
          final myKeys = keyColors.map((c) {
            ++i;
            return XylophoneKey(
              color: c,
              width: w,
              height: h,
              sound: 'sample$i',
            );
          }).toList();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.ltr,
            children: myKeys,
          );
        },
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String sound;

  XylophoneKey({this.color, this.width, this.height, this.sound});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("I was tapped: ${color.toString()}");
        player.play('sounds/$sound.mp3');
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
