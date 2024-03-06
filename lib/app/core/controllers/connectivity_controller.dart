// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_stock_management_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// ConnectivityController is a GetxController that is
/// responsible for managing the internet connection status of the app.
class ConnectivityController extends GetxController {
  final isOnline = false.obs;
  static ConnectivityController get to => Get.find<ConnectivityController>();
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> onInit() async {
    /// Check if the user is onConnectivityChanged subscription

    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    super.onInit();
  }

  /// Check if the user is first connection status
  Future<void> isFirstTimeConnectivity() async {
    final isFirsTimeOnline =
        await _connectivity.checkConnectivity() != ConnectivityResult.none;
    connectivityActions(connectionState: isFirsTimeOnline, isFirstTime: true);
  }

  void _onConnectivityChanged(
    ConnectivityResult connectivityResult,
  ) {
    /// Check if the user is not connected to the internet AND [old state] is true then
    if (isOnline.value == true &&
        connectivityResult == ConnectivityResult.none) {
      log('NO- Internet Connection', name: 'ConnectivityController');
      isOnline.value = false;
      connectivityActions(connectionState: isOnline.value);
    }

    /// Check if the user is connected to the internet AND [old state] is false then
    else if (isOnline.value == false &&
        connectivityResult != ConnectivityResult.none) {
      log('YESSS- Internet Connection', name: 'ConnectivityController');
      isOnline.value = true;
      connectivityActions(connectionState: isOnline.value);
    }
  }

  void connectivityActions({
    required bool connectionState,
    bool isFirstTime = false,
  }) {
    /// Check if the user is not connected to the internet AND current route [NOCONNECTIVITY] then
    if (!connectionState && Get.currentRoute != Routes.NOCONNECTIVITY) {
      Get.toNamed<dynamic>(Routes.NOCONNECTIVITY, preventDuplicates: false);
    }

    /// Check if the user connected to the internet AND splash screen from then
    else if (connectionState && isFirstTime) {
      SplashController.to.redirectRoute();
    }

    /// Check if the user connected to the internet AND current route [NOCONNECTIVITY] then
    else if (connectionState && Get.currentRoute == Routes.NOCONNECTIVITY) {
      Get.close(1);

      /// close the route [NOCONNECTIVITY] then
      /// current route [SPLASH] then
      if (Get.currentRoute == Routes.SPLASH) {
        SplashController.to.redirectRoute();
      }
    }
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }
}
