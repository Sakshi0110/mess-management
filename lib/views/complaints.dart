import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messmate/views/drawer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  List<Map<String, dynamic>> complaintsList = [];

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('complaints')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          complaintsList.add({
            'complaint': doc["complaint"],
            'request': doc["request"],
            'username': doc["username"],
            'time': doc["time"].toDate().toString(),
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issues',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: complaintsList.length,
        itemBuilder: (context, index) {
          final item = complaintsList[index];
          return Dismissible(
            child: Card(
              // shadowColor: Colors.deepOrangeAccent,
              margin: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0),
              color: Colors.grey[100],
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                dense: true,
                title: Text.rich(TextSpan(
                    text: item['request'] ? "Request:  " : "Complaint:  ",
                    style: TextStyle(
                        color: item['request'] ? Colors.green : Colors.red,
                        fontSize: 14.0),
                    children: <InlineSpan>[
                      TextSpan(
                        text: item['complaint'],
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ])),
                //subtitle: Text(item['username'], style: TextStyle(fontSize: 11.0),)),
                subtitle: Text.rich(
                  TextSpan(
                    text: item['username'],
                    style: TextStyle(fontSize: 11.0),
                    children: <InlineSpan>[
                      TextSpan(
                        text: ",  ",
                        style: TextStyle(fontSize: 11.0),
                      ),
                      TextSpan(
                        text: item['time'],
                        style: TextStyle(fontSize: 11.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Text(complaint)),],

            // Specify the direction to swipe and delete
            direction: DismissDirection.endToStart,
            key: Key(item['complaint']),
            onDismissed: (direction) {
              // Removes that item the list on swipwe
              setState(() {
                complaintsList.removeAt(index);
              });
              // Shows the information on Snackbar
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("Issue dismissed")));
            },
            background: Container(color: Colors.red),
            //child: ListTile(title: Text('$item')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 10.0,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Add Issue"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your issue',
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Align(
                    child: ToggleSwitch(
                      fontSize: 10.0,
                      minWidth: 70.0,
                      minHeight: 30.0,
                      cornerRadius: 30.0,
                      activeBgColors: [
                        [Colors.green],
                        [Colors.red]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['Request', 'Complaint'],
                      radiusStyle: true,
                      onToggle: (index) {},
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(height: 30.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton.icon(
                          style: TextButton.styleFrom(primary: Colors.blueGrey),
                          icon: Icon(Icons.add_a_photo),
                          label: Text('Add image',
                              style: TextStyle(fontSize: 12.0)),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent),
                        ),
                      ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
