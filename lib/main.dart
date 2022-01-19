import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercord/controller/zego_engine_controller.dart';
import 'package:fluttercord/ui/screen_capture_init.dart';
import 'package:get/get.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

import 'config/flutter_service.dart';
import 'home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ZegoEngineController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String version = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('FlutterCord'),
      //     centerTitle: true,
      //   ),
      //   body: Center(
      //     child: TextButton(
      //       onPressed: (){
      //         Get.to(ScreenCaptureInitPage());
      //       },
      //       child: const Text('Screen Capture Init'),
      //     )
      //   ),
      // ),
    );
  }
}
