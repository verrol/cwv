import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Widget App',
      debugShowCheckedModeBanner: false,
      home: HomePage('Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // page
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => null,
        ),
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () => null,
            splashColor: Colors.green,
          ),
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () => null,
            splashColor: Colors.green,
          ),
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () => null,
            splashColor: Colors.green,
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is my landing page!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
          Text(
            'Line 1 - here is some text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Text(
          'Footer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
