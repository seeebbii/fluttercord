import 'package:get/get.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class ZegoEngineController extends GetxController {

  // Apply appID and appSign from ZEGO
  final int appID = 3463166776;
  final String appSign = 'e9eecf473659a87d2ebe799aaa4d3f49e7ad964c6f4273a31cbd157881c5e208';

  // Specify test environment and app scenario
  final bool isTestEnv = true;
  final ZegoScenario scenario = ZegoScenario.General;


  @override
  void onInit() {
    super.onInit();
    // Get SDK Version
    ZegoExpressEngine.getVersion().then((value) {
      print("ZEGO CONTROLLER: $value");
    });

    // Create ZegoExpressEngine (Init SDK)
    ZegoEngineProfile profile = ZegoEngineProfile(appID, appSign, scenario);
    ZegoExpressEngine.createEngineWithProfile(profile);

  }

}