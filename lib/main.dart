import 'package:camera/camera.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

import 'Pages/CameraPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          accentColor: Color(0xFF128C7E)),
      home: Homescreen(),
    );
  }
}
