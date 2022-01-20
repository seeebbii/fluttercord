import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

abstract class FlutterService {
  static const MethodChannel _channel = MethodChannel('fluttercord');

  static void startService() async {

    String data = await _channel.invokeMethod("startService");
    debugPrint(data);
  }

  static void stopService() async {
    // final callback = PluginUtilities.getCallbackHandle();
    String data = await _channel.invokeMethod("stopService");
    debugPrint(data);
  }

}