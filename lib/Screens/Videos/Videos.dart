import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../classes/Classe.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  //const appId="8b35a0d0a1e14518893469b12307e134";
  //const token="0068b35a0d0a1e14518893469b12307e134IAAqXbqHU8c7ZNV/W/d0QHimYgjyBqIgNJasVpo/Unvi/evTDPoAAAAAIgCOhaHHebLrYgQAAQB5sutiAgB5sutiAwB5sutiBAB5suti";
  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
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
        title: const Text('Videos',style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: videoed.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return TextButton(
                      onPressed: () async {
                        dynamic url = linkded[index];

                        if (await canLaunchUrl(
                          Uri.parse(url),
                        )) {
                          await launchUrl(
                            Uri.parse(url),
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              videoed[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
