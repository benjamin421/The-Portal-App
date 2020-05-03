import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Style.dart';

class BlogWebView extends StatefulWidget {
  String url;

  BlogWebView(String url) {
    this.url = url;
  }

  @override
  _BlogWebViewState createState() {
    // TODO: implement createState
    return _BlogWebViewState(this.url);
  }
}

class _BlogWebViewState extends State<BlogWebView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String url;

  _BlogWebViewState(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black
        ),
        backgroundColor: Style.backgroungColor,
        title: Text("Blog", style: Style.screenSubtitleStyle),
      ),
      body: WebView(
        initialUrl: this.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
