import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../components/dateAndtemper.dart';
import '../components/itemsButton.dart';
import '../components/sButton.dart';

// ignore: camel_case_types, must_be_immutable
class appWebViewScreen extends StatefulWidget {
  var iconUrl;
  appWebViewScreen({Key? key, required this.iconUrl}) : super(key: key);

  @override
  State<appWebViewScreen> createState() => _appWebViewScreenState();
}

class _appWebViewScreenState extends State<appWebViewScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url2 = widget.iconUrl;
  late var url;
  double progress = 0;
  var urlController = TextEditingController();
  String initialUrl = 'https://www.google.com/';
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.white,
        backgroundColor: Colors.green.shade800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      bottomNavigationBar: bottomAppBar(screenSize),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade700,
        leading: Row(
          children: [
            IconButton(
              onPressed: () async {
                if (await webViewController!.canGoBack()) {
                  webViewController!.goBack();
                }
                setState(() {});
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
          ],
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: TextField(
            onSubmitted: (value) {
              url = Uri.parse(value);
              if (url.scheme.isEmpty) {
                url = Uri.parse('${initialUrl}search?q=$value');
              }
              webViewController!.loadUrl(urlRequest: URLRequest(url: url));
            },
            controller: urlController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                hintText: 'eg. Search Your Site',
                prefixIcon: Icon(Icons.search_rounded)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              webViewController!.reload();
              setState(() {});
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InAppWebView(
                    onProgressChanged: (control, value) {
                      if (value == 100) {
                        refreshController!.endRefreshing();
                      }
                      setState(() {
                        progress = value / 100;
                      });
                    },
                    onLoadStop: (control, value) {
                      refreshController!.endRefreshing();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    pullToRefreshController: refreshController,
                    onLoadStart: (controll, value) {
                      isLoading = true;
                      var v = value.toString();
                      setState(() {
                        urlController.text = v;
                      });
                    },
                    onWebViewCreated: ((controller) =>
                        webViewController = controller),
                    initialUrlRequest: URLRequest(url: Uri.parse(url2)),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: CircularProgressIndicator(
                      value: progress,
                      valueColor: AlwaysStoppedAnimation(Colors.red.shade700),
                    ),
                  )
                ],
              ),
            )
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
