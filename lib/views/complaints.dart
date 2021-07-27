import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messmate/views/drawer.dart';

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  List<String> complaintsList = [];

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('complaints')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          complaintsList.add(doc["complaint"]);
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardsList = [];
    for (String complaint in complaintsList) {
      cardsList.add(
        Card(child: Text(complaint)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MessMate',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: AppDrawer(),
      body: Column(children: cardsList),
    );
  }
}
