import 'package:get/get.dart';

import 'package:flutter_stock_management_app/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_stock_management_app/app/modules/home/views/home_view.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/views/onboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => OnboardView(),
      binding: OnboardBinding(),
    ),
  ];
}
