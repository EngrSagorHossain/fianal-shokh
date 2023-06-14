import 'package:get/get.dart';

import '../controllers/live_data_controller.dart';

class LiveDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveDataController>(
      () => LiveDataController(),
    );
  }
}
