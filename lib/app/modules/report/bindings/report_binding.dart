// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(
      ReportController.new,
    );
  }
}
