import 'package:flutter/material.dart';
import 'package:shareanddownload/screens/MainScreen.dart';
import 'package:shareanddownload/screens/webViewScreen.dart';

class itemsButton extends StatefulWidget {
  const itemsButton({super.key});

  @override
  State<itemsButton> createState() => _itemsButtonState();
}

class _itemsButtonState extends State<itemsButton> {
  List itemsButtonsList = [
    'assets/images/home (1).png',
    'assets/images/search.png',
    'assets/images/youtube (1).png',
    'assets/images/shorts-removebg-preview.png',
    'assets/images/facebook (1).png',
    'assets/images/reels.png',
    'assets/images/instagram (1).png',
    'assets/images/video.png',
    'assets/images/video (1).png',
  ];

  List<dynamic> itemsLinks = [
    const MainScreen(),
    'https://www.google.com/',
    'https://youtube.com/',
    'https://youtube.com/shorts/JetVPA5LRN4',
    'https://facebook.com/',
    'https://facebook.com/reel/',
    'https://instagram.com/',
    'https://instagram.com/reels/',
    'https://tiktok.com/en/',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFFed67af),
              Color(0xFFd17ed1),
              Color(0xFFae93e4),
              Color(0xFFbe97e5),
              Color(0xFFce9ce6),
              Color(0xFFdca1e7),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: itemsButtonsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                index == 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => appWebViewScreen(
                                  iconUrl: itemsLinks[index],
                                )));
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(itemsButtonsList[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
            // Link(
            //   target: LinkTarget.self,
            //   uri: Uri.parse(itemsLinks[index]),
            //   builder: (context, followLink) {
            //     return InkWell(
            //       onTap: followLink,
            //       child: Container(
            //         margin: const EdgeInsets.symmetric(horizontal: 10),
            //         width: 35,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage(itemsButtonsList[index]),
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
