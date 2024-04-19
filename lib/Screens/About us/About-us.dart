import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewController? _webViewController;

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
          'About us',style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Link(
              target: LinkTarget.self,
              uri: Uri.parse('https://www.youtube.com/watch?v=YLi4-aVsG0c'),
              builder: (context, followLink) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: followLink,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  child: Image.asset(
                    'images/youtubes.jpg',
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
