import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_last/Screens/Topics/Weekend/weekendtopic.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../classes/Classe.dart';

class Weekend extends StatefulWidget {
  const Weekend({Key? key}) : super(key: key);

  @override
  State<Weekend> createState() => _WeekendState();
}

class _WeekendState extends State<Weekend> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;
  List<dynamic> topicsspeak = [
    'https://www.englishspokencafe.com/i-cant-speak-weekend/',
    'https://www.englishspokencafe.com/i-can-speak-weekend/',
    'https://www.englishspokencafe.com/i-can-speak-f-weekend/',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekend',style: TextStyle(
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
                        Weekendtopic(
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
                        fontSize: 30,color: Colors.white,
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
