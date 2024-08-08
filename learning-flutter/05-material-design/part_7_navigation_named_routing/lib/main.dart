import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Widget App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/", // DON"T use 'home' property
      routes: {
        "/": (context) => HomePage(),
        "/page1": (context) => Page1(),
        "/page2": (context) => Page2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Page 1'),
              onPressed: () {
                Navigator.pushNamed(context, "/page1");
              },
              textColor: Colors.pink,
            ),
            RaisedButton(
              child: Text('Page 2'),
              onPressed: () {
                Navigator.pushNamed(context, "/page2");
              },
              textColor: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String title = 'Page 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Home'),
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Colors.green,
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String title = 'Page 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Home'),
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: Colors.green,
        ),
      ),
    );
  }
}
