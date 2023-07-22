import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class pageProvider with ChangeNotifier {
  String _url = '/';
  WebViewController _webViewController = WebViewController()
    ..loadRequest(Uri.parse('/'));

  String get url => _url;
  WebViewController get webViewController => _webViewController;

  void setUrl(String adUrl) {
    _url = adUrl;
    _webViewController = WebViewController()..loadRequest(Uri.parse(_url));
    notifyListeners();
  }
}
