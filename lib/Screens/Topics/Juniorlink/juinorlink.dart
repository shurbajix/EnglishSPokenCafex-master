import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/platform_interface.dart';

class Juniorlink extends StatefulWidget {
  const Juniorlink({Key? key}) : super(key: key);

  @override
  State<Juniorlink> createState() => _Junior1State();
}

class _Junior1State extends State<Juniorlink> {
  late InAppWebViewController _webViewController;
  late String? _selectedText;
   String? _definition;
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
            onPressed: _onBack,
            icon: Icon(
              Icons.arrow_back_ios_new,color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text('JUNIOR3',style: TextStyle(
              color: Colors.white,
            ),),
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse('https://www.englishspokencafe.com/junior3/')),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      javaScriptEnabled: true,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController webViewController) {
                    _webViewController = webViewController;
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
                    _webViewController.evaluateJavascript(source: """
                      document.addEventListener('selectionchange', function() {
                        var selectedText = window.getSelection().toString();
                        lookup.postMessage(selectedText);
                      });
                    """);
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
          ],
        ),
        bottomNavigationBar: _definition != null ? Text(_definition!) : null,
      ),
    );
  }

  JavascriptChannel _createJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'lookup',
      onMessageReceived: (JavascriptMessage message) {
        _showDefinition(context, message.message);
      },
    );
  }

  Future<void> _showDefinition(BuildContext context, String word) async {
    const apiKey = 'http://www.uludagsozluk.com/api/?c=getkey';
    const apiUrl = 'http://www.uludagsozluk.com/api/?c=getkey';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      if (data.isNotEmpty && data[0].containsKey('shortdef')) {
        final List<dynamic> definitions = data[0]['shortdef'];
        final String definition = definitions.join('\n');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(word),
              content: Text(definition),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(word),
              content: Text('No definition found for $word'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to get definition for $word'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
