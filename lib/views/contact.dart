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
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVqtZcXq3lIHrkWbuDpxztFr_Fs1OUxekwoQ&usqp=CAU",
                ),
              ),
              title: Text('HOD'),
              subtitle: Text('1234567890'),
              trailing: IconButton(
                icon: Icon(Icons.call_outlined, color: Colors.blueGrey),
                onPressed: () {},
              ),
              dense: true,
            ),
            SizedBox(height: 20.0),
            //Divider(height: 60.0, color: Colors.grey),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbhXtL2Dc5PEUCBJhZHtbRl04Kur3ns_HHsg&usqp=CAU",
                  ),
                ),
                title: Text('Warden'),
                subtitle: Text('2345678901'),
                trailing: IconButton(
                  icon: Icon(Icons.call_outlined, color: Colors.blueGrey),
                  onPressed: () {},
                ),
                dense: true),
          ],
        ),
      ),
    );
  }
}
