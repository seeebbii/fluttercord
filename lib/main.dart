import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:media_projection_creator/media_projection_creator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'config/flutter_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Get.put(ZegoEngineController());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String createMediaProjectionResult = 'Unknown';

  @override
  void initState() {

    super.initState();
  }


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
            child: Column(
              children: const [
                ElevatedButton(
                  onPressed: FlutterService.startService,
                  child: Text("Start Service"),
                ),
                SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: FlutterService.stopService,
                  child:  Text("Stop Service"),
                ),
              ],
            ),
          )),
    );
  }
}
