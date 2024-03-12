import 'package:get/get.dart';

import '../../add_material/controllers/add_material_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/dashboard_controller.dart';

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
