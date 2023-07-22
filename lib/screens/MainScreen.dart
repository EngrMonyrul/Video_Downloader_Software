// Bismillahir Rahmanir Rahim
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import '../components/AppDrawer.dart';
import '../components/dateAndtemper.dart';
import '../components/itemsButton.dart';
import '../components/sButton.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  late String filesName = 'File Name';
  late String filePath = 'File Path';
  late double? progressFile = null;

  _paste() async {
    final data = await Clipboard.getData('text/plain');

    if (data != null) {
      setState(() {
        filesName = data.text.toString();
        FileDownloader.downloadFile(
          url: filesName.trim(),
          onProgress: (fileName, progress) {
            progressFile = progress;
          },
          onDownloadCompleted: (path) {
            filePath = path.toString();
            setState(() {
              progressFile = null;
            });
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      bottomNavigationBar: bottomAppBar(screenSize),
      drawer: Drawer(
        width: screenSize.width * 0.56,
        child: const AppDrawer(),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.35,
            ),
            InkWell(
              onTap: () {
                _paste();
                setState(() {});
              },
              child: CircleAvatar(
                radius: 120,
                foregroundColor: Colors.grey.withOpacity(0.1),
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: CircleAvatar(
                  radius: 110,
                  foregroundColor: Colors.grey.withOpacity(0.2),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: CircleAvatar(
                    radius: 100,
                    foregroundColor: Colors.grey.withOpacity(0.3),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    child: CircleAvatar(
                      radius: 90,
                      foregroundColor: Colors.grey.withOpacity(0.4),
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: CircleAvatar(
                        radius: 80,
                        foregroundColor: Colors.grey.withOpacity(0.5),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 70,
                          foregroundColor: Colors.grey.withOpacity(0.6),
                          backgroundColor: Colors.grey.withOpacity(0.6),
                          child: CircleAvatar(
                            radius: 60,
                            foregroundColor: Colors.grey.withOpacity(0.7),
                            backgroundColor: Colors.grey.withOpacity(0.7),
                            child: CircleAvatar(
                              radius: 50,
                              foregroundColor: Colors.grey.withOpacity(0.8),
                              backgroundColor: Colors.grey.withOpacity(0.8),
                              child: Container(
                                child: Text(
                                  progressFile != null
                                      ? progressFile.toString()
                                      : 'Press To\nDownload',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: screenSize.width * 0.7,
              color: Colors.red,
              child: Text(filesName),
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
          const Expanded(
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
