import 'package:flutter_stock_management_app/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

/// The `LoginBinding` class is extending the `Bindings` class. This means that `LoginBinding` is a
/// custom binding class that is used to define dependencies for a specific route or screen in the
/// Flutter application.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
    );
  }
}
