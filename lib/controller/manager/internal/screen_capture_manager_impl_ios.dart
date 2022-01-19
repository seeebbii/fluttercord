//
// /// Only used for iOS
// import 'package:replay_kit_launcher/replay_kit_launcher.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../screen_capture_manager.dart';
//
//
// /// Private implementation
// class ScreenCaptureManagerImplIOS extends ScreenCaptureManager {
//
//   late String extensionName;
//   late String appGroupID;
//
//   @override
//   Future<Object> startScreenCapture() async {
//     if (extensionName == null || appGroupID == null) {
//       print('On iOS, please `setAppGroup` and `setReplayKitExtensionName` first');
//       return false;
//     }
//     return ReplayKitLauncher.launchReplayKitBroadcast(extensionName);
//   }
//
//   @override
//   Future<bool?> stopScreenCapture() async {
//     return await ReplayKitLauncher.finishReplayKitBroadcast('ZGFinishReplayKitBroadcastNotificationName');
//   }
//
//   @override
//   Future<void> setAppGroup(String appGroupID) async {
//     SharedPreferences config = await SharedPreferences.getInstance();
//     this.appGroupID = appGroupID;
//     await config.setString ("appGroupID", appGroupID);
//   }
//
//   @override
//   Future<void> setReplayKitExtensionName(String extensionName) {
//     this.extensionName = extensionName;
//     return Future.value(null);
//   }
//
//   @override
//   Future<void> setParamsForCreateEngine(int appID, String appSign, bool onlyCaptureVideo) async {
//     SharedPreferences config = await SharedPreferences.getInstance();
//     await config.setInt('ZG_SCREEN_CAPTURE_APP_ID', appID);
//     await config.setString('ZG_SCREEN_CAPTURE_APP_SIGN', appSign);
//     await config.setInt("ZG_SCREEN_CAPTURE_SCENARIO", 0);
//     await config.setBool("ZG_SCREEN_CAPTURE_ONLY_CAPTURE_VIDEO", onlyCaptureVideo);
//   }
//
//   @override
//   Future<void> setParamsForVideoConfig(int videoWidth, int videoHeight, int videoFPS, int videoBitrateKBPS) async {
//     SharedPreferences config = await SharedPreferences.getInstance();
//     await config.setInt("ZG_SCREEN_CAPTURE_VIDEO_SIZE_WIDTH", videoWidth);
//     await config.setInt("ZG_SCREEN_CAPTURE_VIDEO_SIZE_HEIGHT", videoHeight);
//     await config.setInt("ZG_SCREEN_CAPTURE_SCREEN_CAPTURE_VIDEO_FPS", videoFPS);
//     await config.setInt("ZG_SCREEN_CAPTURE_SCREEN_CAPTURE_VIDEO_BITRATE_KBPS", videoBitrateKBPS);
//   }
//
//   @override
//   Future<void> setParamsForStartLive(String roomID, String userID, String userName, String streamID) async {
//     SharedPreferences config = await SharedPreferences.getInstance();
//     await config.setString("ZG_SCREEN_CAPTURE_USER_ID", userID);
//     await config.setString("ZG_SCREEN_CAPTURE_USER_NAME", userName);
//     await config.setString("ZG_SCREEN_CAPTURE_ROOM_ID", roomID);
//     await config.setString("ZG_SCREEN_CAPTURE_STREAM_ID", streamID);
//   }
// }