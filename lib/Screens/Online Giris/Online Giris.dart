import 'package:flutter/material.dart';
import 'package:flutter_application_last/Video/Video_call.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class OnlineG extends StatefulWidget {
  const OnlineG({super.key});

 

  @override
  State<OnlineG> createState() => _OnlineGState();
}

class _OnlineGState extends State<OnlineG> {
     final TextEditingController _meetingNameController = TextEditingController();
  final _jitsiMeetPlugin = JitsiMeet();
  String? _meetingNameError;
joinMeeting() async {
  String room = _meetingNameController.text.trim();
  if (room.isNotEmpty) {
    try {
      var options = JitsiMeetConferenceOptions(room: room);
      await _jitsiMeetPlugin.join(options);
    } catch (error) {
      print("Error starting Jitsi Meet: $error");
    }
  } else {
    // Show error message when text field is empty
    setState(() {
      _meetingNameError = 'Please enter a meeting name.';
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Online Giris',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Column(
                children: const [
                  Text(
                    " Start'ı tıklayın. Kutuya kodu yazıp enter tuşuna basın",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(
                50,
              ),
              child: Image.asset(
                'images/videocalls.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,right: 20,
              ),
              child: TextFormField(
                 onChanged: (value) {
                  // Clear error message when user starts typing
                  setState(() {
                    _meetingNameError = null;
                  });
                },
                controller: _meetingNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Write Your meeting',
                  errorText: _meetingNameError,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: joinMeeting,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

}
