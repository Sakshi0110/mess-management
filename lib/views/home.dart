import 'package:flutter/material.dart';
import 'package:messmate/views/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 190.0,
              width: 190.0,
              image: AssetImage('assets/cook_1.png'),
            ),
            alignment: Alignment.topRight,
          ),
        ]),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepOrangeAccent,
              width: 2.0,
            ),
          ),
          child: Text(
            'Your food schedule for the day',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Column(children: <Widget>[
            ListTile(
              title: Text('Breakfast',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Poha'),
            ),
            ListTile(
              title:
                  Text('Lunch', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('-----'),
            ),
            ListTile(
              title:
                  Text('Snacks', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('-----'),
            ),
            ListTile(
              title:
                  Text('Dinner', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('-----'),
            ),
          ]),
        ),
        Text(
          'Timings:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'Breakfast: 8:00 to 9:00, Lunch: 12:30 to 14:00, Snacks: 16:00 to 17:00, Dinner: 19:30 to 21:00 '),
        ),
      ]),
      drawer: AppDrawer(),
    );
  }
}
