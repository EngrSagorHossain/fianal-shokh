import 'package:get/get.dart';

import '../controllers/group_call_controller.dart';

class GroupCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupCallController>(
      () => GroupCallController(),
    );
  }
}
