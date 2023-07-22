import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the action when the user taps the "Home" option in the drawer
              // For example, navigate to the home page
              Navigator.pop(context); // Close the drawer
              // Add your navigation code here...
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle the action when the user taps the "Settings" option in the drawer
              // For example, navigate to the settings page
              Navigator.pop(context); // Close the drawer
              // Add your navigation code here...
            },
          ),
        ],
      ),
    );
  }
}
