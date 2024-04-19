import 'package:flutter/material.dart';
import 'package:flutter_application_last/Screens/Topics/Friday/Frideytopic.dart';
import 'package:flutter_application_last/classes/Classe.dart';
import 'package:get/get.dart';

class Friday extends StatefulWidget {
  const Friday({Key? key}) : super(key: key);

  @override
  State<Friday> createState() => _FridayState();
}

class _FridayState extends State<Friday> {
  List<dynamic> topicsspeak = [
    'https://www.englishspokencafe.com/i-cant-speak-friday/',
    'https://www.englishspokencafe.com/i-can-speak-friday/',
    'https://www.englishspokencafe.com/i-can-speak-f-friday/',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friday',style: TextStyle(
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
                        Frideytopic(
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
