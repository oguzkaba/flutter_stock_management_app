// ignore_for_file: public_member_api_docs

import 'dart:async';

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
    ///Check if the user is first connection status
    await ConnectivityController.to.isFirstTimeConnectivity();
  }

  ///If the user is connected to the internet, it redirects to the route
  Future<void> redirectRoute() {
    return Future.delayed(Duration(seconds: _splashDuration), () async {
      ///Check if the user is connected to the Supabase
      if (_supabase.user != null) {
        await Get.offAllNamed<dynamic>(Routes.DASHBOARD);
      } else {
        await Get.offAllNamed<dynamic>(Routes.LOGIN);
      }
    });
  }
}
