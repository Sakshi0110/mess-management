import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messmate/views/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseApp defaultApp = Firebase.app();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    db.collection('food').doc('2021-07-25-lunch').get();
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
              subtitle: FieldText('2021-07-25-breakfast'),
            ),
            ListTile(
              title:
                  Text('Lunch', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: FieldText('2021-07-25-lunch'),
            ),
            ListTile(
              title:
              Text('Snacks', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: FieldText('2021-07-25-snacks'),
            ),
            ListTile(
              title:
              Text('Dinner', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: FieldText('2021-07-25-dinner'),
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


class FieldText extends StatelessWidget {
  final String documentId;

  FieldText(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference food = FirebaseFirestore.instance.collection('food');
    return FutureBuilder<DocumentSnapshot>(
      future: food.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data() as Map<
              String,
              dynamic>;
          return Text(" ${data['menu']} ");
        }

        return Text("loading");
      },
    );
  }
}


