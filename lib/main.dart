import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_service.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterCord'),
          centerTitle: true,
        ),
        body:  Center(
          child: ElevatedButton(
            onPressed: () async{
              FlutterService.initialize();
            },
            child: const Text("Start service"),
          ),
        ),
      ),
    );
  }
}
