import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../classes/Classe.dart';

class Mondaytopic extends StatefulWidget {
   Mondaytopic({Key? key, required this.initialUrl, required url, required this.indextitle}) : super(key: key);
  final String initialUrl;
late  int indextitle;
  @override
  State<Mondaytopic> createState() => _MondaytopicState();
}

class _MondaytopicState extends State<Mondaytopic> {
  late InAppWebViewController _webViewController;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          speaklevel[widget.indextitle],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.initialUrl)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
