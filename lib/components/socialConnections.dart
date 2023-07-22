import 'package:flutter/material.dart';
import 'package:shareanddownload/screens/webViewScreen.dart';

Container socialConnections(BuildContext context) {
  List<String> socialIcon = [
    'assets/icons/facebook.png',
    'assets/icons/github.png',
    'assets/icons/instagram.png',
    'assets/icons/linkedin.png',
  ];

  List<String> socailLinks = [
    'https://www.facebook.com/moni.01533686262/',
    'https://github.com/EngrMonyrul?tab=repositories',
    'https://www.instagram.com/monirulislam.mony/',
    'https://www.linkedin.com/in/monirul-islam-52188a275/',
  ];
  return Container(
    height: 50,
    child: Row(
      children: List.generate(
        socialIcon.length,
        (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => appWebViewScreen(
                            iconUrl: socailLinks[index],
                          )));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              width: 40,
              child: Image.asset(
                socialIcon[index],
              ),
            ),
          );
        },
      ),
    ),
  );
}
