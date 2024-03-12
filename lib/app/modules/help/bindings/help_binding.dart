// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/modules/help/controllers/help_controller.dart';
import 'package:get/get.dart';

class HelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(
      HelpController.new,
    );
  }
}
