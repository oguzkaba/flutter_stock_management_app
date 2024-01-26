import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:flutter_stock_management_app/app/core/controllers/window_controller.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:get/get.dart';

/// The `class OnboardBinding extends Bindings` is creating a binding class for the `Onboard` module in
/// the Flutter Stock Management App.
class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<OnboardController>(
        OnboardController.new,
      )
      ..lazyPut<ThemeController>(
        ThemeController.new,
      )
      ..lazyPut<HomeController>(
        HomeController.new,
      )
      ..put<WindowController>(
        WindowController(),
      )
      ..put<AddMaterialController>(
        AddMaterialController(),
      );
  }
}
