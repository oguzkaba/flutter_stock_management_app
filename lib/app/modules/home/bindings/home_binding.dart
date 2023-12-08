import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

/// The `HomeBinding` class is extending the `Bindings` class. This means that `HomeBinding` is
/// inheriting all the properties and methods of the `Bindings` class.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      HomeController.new,
    );
  }
}
