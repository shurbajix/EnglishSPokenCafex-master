import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_last/Screens/Topics/Wednesday/Wedensdaytopic.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../classes/Classe.dart';

class Wednesday extends StatefulWidget {
  const Wednesday({Key? key}) : super(key: key);

  @override
  State<Wednesday> createState() => _WednesdayState();
}

class _WednesdayState extends State<Wednesday> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;
  late String url;
  List<dynamic> topicsspeak = [
    'https://www.englishspokencafe.com/i-cant-speak-wednesday/',
    'https://www.englishspokencafe.com/i-can-speak-wednesday/',
    'https://www.englishspokencafe.com/i-can-speak-f-wednesday/',
  ];

  @override
  Widget build(BuildContext context) {
    String initialUrl = topicsspeak[2];
    return Scaffold(
      appBar: AppBar(
        title: Text('Wednesday',style: TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 50,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.to(
                        Wedensdaytopic(
                          url: topicsspeak[index],
                          initialUrl: topicsspeak[index],
                          indextitle: index,
                        ),
                      );
                    },
                    child: Text(
                      speaklevel[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
