// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/core/controllers/connectivity_controller.dart';
import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:flutter_stock_management_app/app/core/controllers/window_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<ConnectivityController>(ConnectivityController())
      ..put<ThemeController>(ThemeController())
      ..put<WindowController>(WindowController());
  }
}
