// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      SettingsController.new,
    );
  }
}
