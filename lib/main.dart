import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:media_projection_creator/media_projection_creator.dart';

import 'config/flutter_service.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Get.put(ZegoEngineController());

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
  String createMediaProjectionResult = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // void launch() async {
  //   int errorCode = await MediaProjectionCreator.createMediaProjection();
  //
  //   setState(() {
  //     debugPrint('createMediaProjection, result: $errorCode');
  //     switch (errorCode) {
  //       case MediaProjectionCreator.ERROR_CODE_SUCCEED:
  //         createMediaProjectionResult = 'Succeed';
  //         break;
  //       case MediaProjectionCreator.ERROR_CODE_FAILED_USER_CANCELED:
  //         createMediaProjectionResult = 'Failed: User Canceled';
  //         break;
  //       case MediaProjectionCreator.ERROR_CODE_FAILED_SYSTEM_VERSION_TOO_LOW:
  //         createMediaProjectionResult = 'Failed: System API level need to higher than 21';
  //         break;
  //     }
  //   });
  // }
  //
  // void finish() async {
  //   await MediaProjectionCreator.destroyMediaProjection();
  //   setState(() {
  //     createMediaProjectionResult = 'Unknown';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterCord'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {
            FlutterService.initialize();
          }, child: const  Text("Start Service"),),
        )
      ),
    );
  }
}
