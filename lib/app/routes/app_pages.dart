import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/bindings/add_material_binding.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/views/add_material_view.dart';
import 'package:flutter_stock_management_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_stock_management_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_stock_management_app/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_stock_management_app/app/modules/home/views/home_view.dart';
import 'package:flutter_stock_management_app/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_stock_management_app/app/modules/login/views/login_view.dart';
import 'package:flutter_stock_management_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_stock_management_app/app/modules/splash/views/splash_view.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/no_connectivity_widget.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

/// The AppPages class is a utility class with a private constructor.
class AppPages {
  AppPages._();

  /// The `static const INITIAL` is a constant
  /// variable that represents the initial route of the
  /// application. In this case, it is set to `Routes.LOGIN`,
  ///  which means that when the application
  /// starts, it will navigate to the login view.
  static const INITIAL = Routes.SPLASH;

  /// The `static final routes` is a list of `GetPage` objects
  /// that define the routes for the
  /// application. Each `GetPage` object represents a route in the application
  /// and contains information
  /// such as the route name, the corresponding view,
  /// and the binding class for that view.
  static final routes = [
    GetPage<Widget>(
      name: _Paths.DASHBOARD,
      page: DashboardView.new,
      binding: DashboardBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.ADD_MATERIAL,
      page: AddMaterialView.new,
      binding: AddMaterialBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.HOME,
      page: HomeView.new,
      binding: HomeBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.LOGIN,
      page: LoginView.new,
      binding: LoginBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.SPLASH,
      page: SplashView.new,
      binding: SplashBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.NOCONNECTIVITY,
      page: NoConnectivityWidget.new,
    ),
  ];
}
