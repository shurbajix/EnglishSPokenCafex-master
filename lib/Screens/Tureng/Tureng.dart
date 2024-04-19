import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Turengs extends StatefulWidget {
  const Turengs({Key? key}) : super(key: key);

  @override
  State<Turengs> createState() => _TurengsState();
}

class _TurengsState extends State<Turengs> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          'Tureng',style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://tureng.com/tr/turkce-ingilizce'),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useOnDownloadStart: true,
                  javaScriptEnabled: true,
                ),
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                print('Page started loading: $url');
              },
              onLoadStop: (controller, url) {
                print('Page finished loading: $url');
                controller.evaluateJavascript(
                  source: "document.getElementsByTagName('header')[0].style.display='none';"
                          "document.getElementsByTagName('footer')[0].style.display='none';",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
