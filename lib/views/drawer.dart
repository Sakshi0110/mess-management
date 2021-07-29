import 'package:flutter/material.dart';
import 'package:messmate/widgets/gauth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var header;
    if (true) {
      header = UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
        accountName: Text('Sakshi Sindhuja' + "  (" + 'Student' + ")"),
        accountEmail: Text('sakshisindhuja850@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://www.vhv.rs/dpng/d/426-4264903_user-avatar-png-picture-avatar-profile-dummy-transparent.png"),
        ),
      );
    } else {
      header = DrawerHeader(
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 16.0),
            child: GAuthButton()),
      );
    }
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        header,
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
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/contact');
          },
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Members'),
        ),
      ]),
    );
  }
}
