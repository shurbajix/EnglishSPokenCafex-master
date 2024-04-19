import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class Gathers extends StatefulWidget {
  const Gathers({Key? key}) : super(key: key);

  @override
  State<Gathers> createState() => _GathersState();
}

class _GathersState extends State<Gathers> {
  late InAppWebViewController webViewController;

 Future<bool> _onBack() async {
  var canGoBack = await webViewController.canGoBack();
  if (canGoBack) {
    webViewController.goBack(); // Go back one step in webview history
    return false; // Prevent the default back button behavior
  } else {
    Navigator.of(context).pop(); // Navigate back in the widget tree
    return true;
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
        //key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: _onBack,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Text(
            'Gamer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                "https://www.englishspokencafe.com/games/",
              ),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webViewController = controller;
            },
            onLoadStop: (controller, url) {
              // Execute JavaScript code to remove header and footer
              controller.evaluateJavascript(source: '''
                // Insert your JavaScript code here to remove header and footer
                // Example:
                document.querySelector('header').style.display = 'none';
                document.querySelector('footer').style.display = 'none';
              ''');
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
