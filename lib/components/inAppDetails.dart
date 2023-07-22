import 'package:flutter/material.dart';

import '../screens/contactPage.dart';
import '../screens/downloadPage.dart';
import '../screens/reportPage.dart';
import '../screens/settings.dart';

class inAppDetails extends StatefulWidget {
  const inAppDetails({super.key});

  @override
  State<inAppDetails> createState() => _inAppDetailsState();
}

class _inAppDetailsState extends State<inAppDetails> {
  List buildinIcon = [
    Icons.settings_outlined,
    Icons.contact_support_outlined,
    Icons.download_for_offline_outlined,
    Icons.report_gmailerrorred,
  ];

  List functions = [
    const SettingsPage(),
    const ContactPage(),
    const downloadPage(),
    const ReportPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate(buildinIcon.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => functions[index]));
              setState(() {});
            },
            child: Container(
              height: 50,
              width: 50,
              child: Icon(
                buildinIcon[index],
                size: 35,
              ),
            ),
          );
        }),
      ),
    );
  }
}
