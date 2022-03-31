import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timechamp/screens/camera/camera.dart';
import 'package:timechamp/screens/detail/detail.dart';
import 'package:timechamp/screens/detail/widgets/calendar.dart';
import 'package:timechamp/screens/home/home.dart';
import 'package:timechamp/screens/location/location.dart';
import 'package:timechamp/screens/service/FetchData.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MaterialApp(
    // home: MainScreen(),

    debugShowCheckedModeBanner: false,
    title: 'TimeChamp',
    initialRoute: '/',
    routes: {
      '/':(ctx) => HomePage(),
      DetailPage.routeName: (ctx) => DetailPage(),
      CalendarScreen.routeName: (ctx) => CalendarScreen(),
      FetchDataPage.routeName: (ctx) => FetchDataPage(),
      LocationScreen.routeName: (ctx) => LocationScreen(),
      CameraScreen.routeName: (ctx) => CameraScreen(camera: firstCamera)
    },
    //camera: firstCamera,

  ));
}
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(
    //  SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    //);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeChamp',
      home: HomePage(),
    );
  }
}
*/
