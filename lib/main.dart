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
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'config/flutter_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    initTensorModel();
    super.initState();
  }

  final _imagePicker = ImagePicker();


  Future<void> initTensorModel() async {
    await Tflite.loadModel(model: 'assets/model/model_quant.tflite', labels: 'assets/model/labels.txt')
        .then((value) => print("Model loaded status: $value"));
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
              children: [
                const ElevatedButton(
                  onPressed: FlutterService.startService,
                  child: Text("Start Service"),
                ),
                const SizedBox(height: 25,),
                const ElevatedButton(
                  onPressed: FlutterService.stopService,
                  child:  Text("Stop Service"),
                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: ()async{
                    final images = await _imagePicker.pickImage(source: ImageSource.gallery);
                    print(images);
                  },
                  child:  const Text("Image Picker"),
                ),
              ],
            ),
          )),
    );
  }
}
