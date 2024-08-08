import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Widget App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page1();
                }));
              },
              textColor: Colors.pink,
            ),
            RaisedButton(
              child: Text('Page 2'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Page2();
                }));
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
