import 'package:flutter/material.dart';

class DownloadSection extends StatefulWidget {
  const DownloadSection({super.key});

  @override
  State<DownloadSection> createState() => _DownloadSectionState();
}

class _DownloadSectionState extends State<DownloadSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text('Download Section'),
          ],
        ),
      ),
    );
  }
}
