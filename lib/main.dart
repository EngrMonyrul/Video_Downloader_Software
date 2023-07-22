import 'package:flutter/material.dart';
import 'package:shareanddownload/components/downloadSection.dart';
import 'package:shareanddownload/providers/likeAndDislike.dart';
import 'package:shareanddownload/providers/pageLink.dart';
import 'package:shareanddownload/screens/MainScreen.dart';
import 'package:provider/provider.dart';
import 'package:shareanddownload/screens/another.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LikeDislikeProvider()),
        ChangeNotifierProvider(create: (_) => pageProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Share & Save',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'times new roman',
              brightness: Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              'home': (context) => const MainScreen(),
              'download': (context) => const DownloadSection(),
              '/': (context) => const DonwloaderApp(),
            },
          );
        },
      ),
    );
  }
}
