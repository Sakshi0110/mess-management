import 'package:flutter/material.dart';
import 'package:messmate/views/about.dart';
import 'package:messmate/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/home", routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Home(),
      '/about': (BuildContext context) => new AboutPage(),
    });
  }
}



