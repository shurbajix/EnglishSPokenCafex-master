import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dialogway extends StatefulWidget {
  const Dialogway({Key? key}) : super(key: key);

  @override
  State<Dialogway> createState() => _DialogState();
}

class _DialogState extends State<Dialogway> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 40,
          onPressed: () async {
            String url = 'https://www.facebook.com/spokencafe.findikzade';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              );
            } else {
              print('The action is not supported');
            }
          },
          icon: Tab(
            icon: Image.asset('images/Facebook.png'),
          ),
        ),
        IconButton(
          iconSize: 40,
          onPressed: () async {
            String url = 'https://www.instagram.com/englishspokencafe/';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              );
            } else {
              print('The action is not supported');
            }
          },
          icon: Tab(
            icon: Image.asset('images/instegram.png'),
          ),
        ),
        IconButton(
          iconSize: 50,
          onPressed: () async {
            String url = 'https://www.youtube.com/c/EnglishSpokenCafecom';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              );
            } else {
              print('The action is not supported');
            }
          },
          icon: Tab(
            icon: Image.asset('images/youtube.jpg'),
          ),
        ),
      ],
    );
  }
}
