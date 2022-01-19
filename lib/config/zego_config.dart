import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:math' show Random;

import 'package:zego_express_engine/zego_express_engine.dart' show ZegoScenario;

class ZegoConfig {

  static final ZegoConfig instance = ZegoConfig._internal();

  late String appGroup;

  late int appID;
  late String appSign;
  late int scenario;

  late String userID;
  late String userName;

  late String roomID;
  late String streamID;

  ZegoConfig._internal();

  Future<void> load() async {
    SharedPreferences config = await SharedPreferences.getInstance();

    appGroup = config.getString('appGroup') ?? '';

    appID = config.getInt('appID') ?? 0;
    appSign = config.getString('appSign') ?? '';
    scenario = config.getInt('scenario') ?? ZegoScenario.General.index;

    userID = config.getString('userID') ?? '${Platform.operatingSystem}-${Random().nextInt(9999999).toString()}';
    userName = config.getString('userName') ?? 'user-$userID';

    roomID = config.getString('roomID') ?? '';
    streamID = config.getString('streamID') ?? '';
  }

  Future<void> saveConfig() async {

    SharedPreferences config = await SharedPreferences.getInstance();

    config.setString('appGroup', appGroup);

    config.setInt('appID', appID);
    config.setString('appSign', appSign);
    config.setInt('scenario', scenario);

    config.setString('userID', userID);
    config.setString('userName', userName);

    config.setString('roomID', roomID);
    config.setString('streamID', streamID);
  }

}