import 'package:flutter/material.dart';
import 'package:messmate/views/drawer.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: AppDrawer(),
      body: Card(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('HOD'),
              subtitle: Text('1234567890'),
              dense: true,
            ),
            Divider(height: 60.0, color: Colors.grey),
            ListTile(
                title: Text('Warden'),
                subtitle: Text('2345678901'),
                dense: true),
          ],
        ),
      ),
    );
  }
}
