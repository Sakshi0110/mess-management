import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MessMate',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Hi there, Sakshi!',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Align(
              child: Image(
                height: 175.0,
                width: 175.0,
                image: AssetImage('assets/cook_1.png'),
              ),
              alignment: Alignment.topRight,
            ),
          ]),
          Container(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Text(
                'Your food schedule for the day!',
                style: Theme.of(context).textTheme.headline6,
              ))
        ]),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            //Container(
            //height:100.0,
            //child:
            DrawerHeader(
              //padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                image: DecorationImage(
                  image: AssetImage('assets/covered_tray.png'),
                  fit: BoxFit.fill,
                ),

                //color: Colors.deepOrangeAccent,
                shape: BoxShape.rectangle,
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
            ),
            ListTile(
              leading: Icon(Icons.add_to_queue),
              title: Text('Request'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Complaints Cart'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Contact us'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Members'),
            ),
          ]),
        ),
      ),
    ));
  }
}
