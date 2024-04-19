import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'HomePage.dart';
import 'globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final String oneSignalAppId = "63505b10-3492-426b-9dc3-4a5f2c5ddca9";

  const MyApp({super.key});
  
Future<void> initOneSignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose,);
  OneSignal.initialize(oneSignalAppId);
  OneSignal.Notifications.requestPermission(true);
  await OneSignal.Debug.setLogLevel(oneSignalAppId as OSLogLevel);
  await initOneSignal();
}
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'English Spoken Cafe',
      //navigatorKey: globals.appNavigator,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children:  const [
            HomePages(),
          ],
        ),
      ),
    );
  }
}
