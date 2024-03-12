// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/modules/print/controllers/print_controller.dart';
import 'package:get/get.dart';

class PrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintController>(
      PrintController.new,
    );
  }
}
