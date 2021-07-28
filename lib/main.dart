import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messmate/views/about.dart';
import 'package:messmate/views/complaints.dart';
import 'package:messmate/views/home.dart';
import 'package:messmate/views/loading.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool firebaseConnected = false;

  void connectToFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      firebaseConnected = true;
    });
  }

  @override
  initState() {
    connectToFirebase();
    super.initState();
    // Add listeners to this class
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/home", routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) =>
          firebaseConnected ? Home() : LoadingPage(),
      '/about': (BuildContext context) => new AboutPage(),
      '/issues': (BuildContext context) => new ComplaintsPage(),
    });
  }
}
