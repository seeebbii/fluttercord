import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

abstract class FlutterService {
  static const MethodChannel startService = MethodChannel('fluttercord');

  static void initialize() async {
    // final callback = PluginUtilities.getCallbackHandle();
    String data = await startService.invokeMethod("startService");
    debugPrint(data);
  }
}