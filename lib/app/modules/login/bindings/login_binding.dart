import 'package:flutter_stock_management_app/app/core/controllers/window_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.put<WindowController>(
      WindowController(),
    );
  }
}
