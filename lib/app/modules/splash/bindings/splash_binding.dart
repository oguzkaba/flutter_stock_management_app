// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      SplashController.new,
    );
  }
}
