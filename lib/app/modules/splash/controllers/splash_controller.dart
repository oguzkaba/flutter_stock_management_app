// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/core/controllers/connectivity_controller.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find<SplashController>();
  final _splashDuration = 3;
  final _supabase = SupabaseService.instance;

  @override
  Future<void> onInit() async {
    await _initAppConnectAndAuth();
    super.onInit();
  }

  Future<void> _initAppConnectAndAuth() async {
    ConnectivityController.to.isOnline.stream.listen((isOnline) {
      if (isOnline) {
        _redirectRoute();
      }
    });
  }

  Future<void> _redirectRoute() {
    return Future.delayed(
      Duration(seconds: _splashDuration),
      () {
        if (_supabase.user != null) {
          Get.offAllNamed<dynamic>(Routes.DASHBOARD);
        } else {
          Get.offAllNamed<dynamic>(Routes.LOGIN);
        }
      },
    );
  }
}
