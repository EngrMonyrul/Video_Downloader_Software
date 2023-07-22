import 'package:flutter/material.dart';

import 'p1_1.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Drawer Example'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Your app content goes here.'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Open Drawer', // Button to open the drawer
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            // If the third item is tapped (index 2), open the drawer
            Scaffold.of(context).openDrawer();
          }
        },
      ),
    );
  }
}
