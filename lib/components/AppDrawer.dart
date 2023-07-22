import 'package:flutter/material.dart';
import 'package:shareanddownload/components/socialConnections.dart';
import 'appDrawerImageBio.dart';
import 'drawerHeaderTitle.dart';
import 'inAppDetails.dart';
import 'likeAndDislike.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFd16ba5),
            Color(0xFFc777b9),
            Color(0xFFba83ca),
            Color(0xFFaa8fd8),
            Color(0xFF9a9ae1),
            Color(0xFF8aa7ec),
            Color(0xFF79b3f4),
            Color(0xFF69bff8),
            Color(0xFF52cffe),
            Color(0xFF41dfff),
            Color(0xFF46eefa),
            Color(0xFF5ffbf1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            drawerHeaderTitle(),
            const SizedBox(
              height: 10,
            ),
            ImageBioArea(),
            const SizedBox(
              height: 80,
            ),
            const likeAndDislike(),
            const SizedBox(
              height: 20,
            ),
            socialConnections(context),
            const Text(
                'Login In Facebook, Instgram, Github, Youtube before opening this app to get better perfomance'),
            const SizedBox(
              height: 20,
            ),
            const inAppDetails(),
            const SizedBox(
              height: 125,
            ),
            const Center(
              child: Text('Credits @Monirul_Islam'),
            ),
          ],
        ),
      ),
    );
  }
}
