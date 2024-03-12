// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/modules/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      NotificationController.new,
    );
  }
}
