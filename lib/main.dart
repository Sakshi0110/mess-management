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
        body: Image(
          image: AssetImage('assets/cook_1.png'),
        ),
        //image: NetworkImage('https://w1.pngwing.com/pngs/14/27/png-transparent-chef-cooking-restaurant-food-cookbook-pleased-gesture-chief-cook-thumbnail.png'),),
        //child: Container(
        //Text("Hi there, null!! Here's your food routine for the day",
        //TextStyle(
        //Colors.black,
        //fontSize: 30,

        //),)

        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.rectangle,
              ),

              //body: Center(
              child: const Center(
                child: Text(
                  'MessMate Panel',
                  //textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
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
