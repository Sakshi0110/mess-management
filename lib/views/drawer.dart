import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            image: DecorationImage(
              image: AssetImage('assets/covered_tray.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Text(''),
        ),
        ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/home');
            }),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('Search'),
        ),
        ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Issues'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/issues');
            }),
        ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/about');
            }),
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
    );
  }
}
