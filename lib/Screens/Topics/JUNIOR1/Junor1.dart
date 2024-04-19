import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Junior1 extends StatefulWidget {
  const Junior1({Key? key}) : super(key: key);

  @override
  State<Junior1> createState() => _Junior1State();
}

class _Junior1State extends State<Junior1> {
  final Completer<InAppWebViewController> _controller =
      Completer<InAppWebViewController>();

   late InAppWebViewController _webViewController;
Future<bool> _onBack() async {
  var canGoBack = await _webViewController.canGoBack();
  if (canGoBack) {
    _webViewController.goBack(); // Go back one step in webview history
    return false; // Prevent the default back button behavior
  } else {
    Navigator.of(context).pop(); // Navigate back in the widget tree
    return true;
  }
}

  Future<bool> _onWillPop() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
      return false;
    } else {
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed:_onBack,
            icon: Icon(
              Icons.arrow_back_ios_new, color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text(
            'JUNIOR1', style: TextStyle(
            color: Colors.white,
          ),),
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: Uri.parse('https://www.englishspokencafe.com/junior1/')),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController webViewController) {
                      _webViewController = webViewController;
                      _controller.complete(webViewController);
                    },
                    onProgressChanged: (controller, progress) {
                      print("WebView is loading (progress: $progress%)");
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('header')[0].style.display='none'");
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('footer')[0].style.display='none'");
                    },
                    onLoadStart: (controller, url) {
                      print('page started loading :$url');
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('header')[0].style.display='none'");
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('footer')[0].style.display='none'");
                    },
                    onLoadStop: (controller, url) {
                      print('Page finished loading: $url');
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('header')[0].style.display='none'");
                      _webViewController.evaluateJavascript(source: "document.getElementsByTagName('footer')[0].style.display='none'");
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      print("console message: ${consoleMessage.message}");
                    },
                    onLoadError: (controller, url, code, message) {
                      print("error loading $url: $message");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
