import 'package:get/get.dart';

import '../controllers/video_live_controller.dart';

class VideoLiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoLiveController>(
      () => VideoLiveController(),
    );
  }
}
