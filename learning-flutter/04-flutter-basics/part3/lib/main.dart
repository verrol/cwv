import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:part3/bloc/counter_bloc.dart';

void main() {
  runApp(MyColumnTextWidget());
}

class MyColumnTextWidget extends StatelessWidget {
  CounterBloc bloc;
  MyColumnTextWidget() {
    bloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyTextWidget(
          bloc,
          color: Colors.amber,
        ),
        MyTextWidget(
          bloc,
          color: Colors.purple,
        ),
        MyTextWidget(bloc),
        MyTextWidget(
          bloc,
          color: Colors.green,
        ),
      ],
    );
  }
}

class MyTextWidget extends StatefulWidget {
  final CounterBloc bloc;
  final Color color;

  MyTextWidget(this.bloc, {this.color});

  @override
  _MyTextWidgetState createState() => _MyTextWidgetState(bloc, color);
}

class _MyTextWidgetState extends State<MyTextWidget> {
  CounterBloc bloc;
  String text = 'Default value';
  final Color color;

  _MyTextWidgetState(this.bloc, this.color) {
    bloc.getCount().listen((count) {
      setState(() {
        // update your state in here
        text = 'Count: $count';
        // print(text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      ),
    );
  }
}
