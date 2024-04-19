import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

Future<void> izinleriIste() async {
  var camerastatus = await Permission.camera.status;
  var microfonstatus = await Permission.microphone.status;
  if (!camerastatus.isGranted) {
    await Permission.camera.request();
  }

  if (!microfonstatus.isGranted) {
    await Permission.microphone.request();
  }
}

class speakcan extends StatefulWidget {
  const speakcan({super.key});

  @override
  _WikipediaExplorerState createState() => _WikipediaExplorerState();
}

class _WikipediaExplorerState extends State<speakcan> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      Platform.isAndroid;
    }
    if (Platform.isIOS) {
      Platform.isIOS;
    }
  }

  late InAppWebViewController webViewController;

  Future<bool> _onBack() async {
    bool goBack;
    var value = await webViewController.canGoBack();
    if (value) {
      webViewController.goBack();
      return false;
    } else {
      exit(0);
    }
  }

  Future<bool> _onWillPop() async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
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
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Text(
            '''I can't speak''',style: TextStyle(
            color: Colors.white,
          ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                "https://meet.jit.si/EnglishSpokenCafeIcantSpeakGather",
              ),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                userAgent:
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36",
                javaScriptCanOpenWindowsAutomatically: true,
                useShouldOverrideUrlLoading: true,
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webViewController = controller;
            },
            androidOnPermissionRequest: (InAppWebViewController controller,
                String origin, List<String> resources) async {
              return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT,
              );
            },
          ),
        ),
      ),
    );
  }
}
//https://meet.jit.si/plugintestroom