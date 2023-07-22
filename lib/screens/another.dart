import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DonwloaderApp extends StatefulWidget {
  const DonwloaderApp({super.key});

  @override
  State<DonwloaderApp> createState() => _DonwloaderAppState();
}

class _DonwloaderAppState extends State<DonwloaderApp> {
  TextEditingController _textEditingController = TextEditingController();
  double? _progress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TextField(
            controller: _textEditingController,
          ),
          ElevatedButton(
            onPressed: () {
              FileDownloader.downloadFile(
                url: _textEditingController.text.trim(),
                onProgress: (fileName, progress) {
                  setState(() {
                    _progress = progress;
                  });
                },
                onDownloadCompleted: (path) {
                  print('path $path');
                  setState(() {
                    _progress = null;
                  });
                },
              );
            },
            child: Text('Press'),
          )
        ],
      ),
    );
  }
}
