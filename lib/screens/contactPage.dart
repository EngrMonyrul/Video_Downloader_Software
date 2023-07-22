import 'package:flutter/material.dart';
import 'package:shareanddownload/components/AppDrawer.dart';

import '../components/dateAndtemper.dart';
import '../components/itemsButton.dart';
import '../components/sButton.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        width: screenSize.width * 0.56,
        child: const AppDrawer(),
      ),
      bottomNavigationBar: bottomAppBar(screenSize),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
              child: const Text(
                'Contacts Will Update Soon',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomAppBar(Size screenSize) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
      height: screenSize.height * 0.05,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            flex: 12,
            child: InkWell(
              onTap: () {
                setState(() {
                  _globalKey.currentState?.openDrawer();
                });
              },
              child: sButton(),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 68,
            child: itemsButton(),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 20,
            child: dateAndtemper(),
          ),
        ],
      ),
    );
  }
}
