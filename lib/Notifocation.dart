import 'package:flutter/material.dart';

class Notfoication extends StatefulWidget {
  const Notfoication({super.key, required this.postId});
  final String postId;

  @override
  State<Notfoication> createState() => _NotfoicationState();
}

class _NotfoicationState extends State<Notfoication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.postId,style: TextStyle(
            color: Colors.white,
          ),),
      ),
    );
  }
}
