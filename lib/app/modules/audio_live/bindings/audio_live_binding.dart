import 'package:get/get.dart';

import '../controllers/audio_live_controller.dart';

class AudioLiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioLiveController>(
      () => AudioLiveController(),
    );
  }
}
