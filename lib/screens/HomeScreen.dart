import 'package:flutter/material.dart';

import '../pactice/p1_1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
            if (value == 2) {
              _scaffoldKey.currentState?.openDrawer();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
