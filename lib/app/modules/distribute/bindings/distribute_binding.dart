import 'package:get/get.dart';

import '../controllers/distribute_controller.dart';

class DistributeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistributeController>(
      () => DistributeController(),
    );
  }
}
