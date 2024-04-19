import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

Future<void> requestPermissions() async {
  await Permission.camera.request();
  await Permission.microphone.request();
}

class VideoCalls extends StatefulWidget {
  const VideoCalls({Key? key}) : super(key: key);

  @override
  _VideoCallsState createState() => _VideoCallsState();
}

class _VideoCallsState extends State<VideoCalls> {
  InAppWebViewController? _webViewController;
  bool? _isLoading = true;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    String userAgent = Platform.isIOS
        ? 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/605.1.15'
        : 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Get.back();
            });
            
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Video Call',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                  "https://meet.jit.si/",
                ),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  userAgent: userAgent,
                  javaScriptCanOpenWindowsAutomatically: true,
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: false,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onLoadStart: (controller, url) async {
                setState(() {
                  _isLoading = true;
                });
              },
              onLoadStop: (controller, url) async {
                // Hiding header and footer using JavaScript
                await _webViewController?.evaluateJavascript(
                  source: '''
                    var header = document.querySelector("header");
                    if (header) header.style.display = "none";
                    var footer = document.querySelector("footer");
                    if (footer) footer.style.display = "none";
                  ''',
                );
                setState(() {
                  _isLoading = false;
                });
              },
              onLoadError: (controller, url, code, message) {
                setState(() {
                  _isLoading = false;
                });
                if (_isLoading!) {
                  Positioned.fill(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            if (_isLoading!)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
