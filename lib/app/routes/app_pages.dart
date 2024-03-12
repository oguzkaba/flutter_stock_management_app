import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/add_material/bindings/add_material_binding.dart';
import '../modules/add_material/views/add_material_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/distribute/bindings/distribute_binding.dart';
import '../modules/distribute/views/distribute_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/print/bindings/print_binding.dart';
import '../modules/print/views/print_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/widgets/no_connectivity_widget.dart';

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
    GetPage<Widget>(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.DISTRIBUTE,
      page: () => const DistributeView(),
      binding: DistributeBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.PRINT,
      page: () => const PrintView(),
      binding: PrintBinding(),
    ),
    GetPage<Widget>(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
