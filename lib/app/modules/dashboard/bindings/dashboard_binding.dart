import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

/// The `class OnboardBinding extends Bindings` is creating a binding class for the `Onboard` module in
/// the Flutter Stock Management App.
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<DashboardController>(
        DashboardController(),
      )
      ..put<AddMaterialController>(
        AddMaterialController(),
      )
      ..put<HomeController>(
        HomeController(),
      );
  }
}
