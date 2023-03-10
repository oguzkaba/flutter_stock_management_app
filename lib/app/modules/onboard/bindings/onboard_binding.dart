import 'package:flutter_stock_management_app/app/core/controllers/window_controller.dart';
import 'package:get/get.dart';

import '../../../core/controllers/theme_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(
      () => OnboardController(),
    );
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<WindowController>(
      WindowController(),
    );
  }
}
