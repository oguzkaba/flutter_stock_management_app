// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final isOnline = false.obs;
  static ConnectivityController get to => Get.find<ConnectivityController>();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Future<void> onInit() async {
    isOnline.value =
        await _connectivity.checkConnectivity() != ConnectivityResult.none;
    connectivityActions();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    super.onInit();
  }

  Future<void> _onConnectivityChanged(
    ConnectivityResult connectivityResult,
  ) async {
    if (connectivityResult == ConnectivityResult.none) {
      isOnline.value = false;
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth) {
      isOnline.value = true;
    } else {
      isOnline.value = false;
    }
    connectivityActions();
  }

  void connectivityActions() {
    if (isOnline.value) {
      if (Get.currentRoute == Routes.NO_CONNECTIVITY) {
        Get.back<dynamic>();
      }
    } else {
      Get.toNamed<dynamic>(Routes.NO_CONNECTIVITY);
    }
  }

  @override
  Future<void> onClose() async {
    await _connectivitySubscription.cancel();
    super.onClose();
  }

  // Future<void> initialize() async {
  //   final result = await Connectivity().checkConnectivity();
  //   isInternetConnected(result);
  //   subscription =
  //       Connectivity().onConnectivityChanged.listen(isInternetConnected);
  // }

  // final isConnected = false.obs;

  // bool isInternetConnected(ConnectivityResult? result) {
  //   if (result == ConnectivityResult.none) {
  //     _connectivityActions(false);
  //     return false;
  //   } else if (result == ConnectivityResult.mobile ||
  //       result == ConnectivityResult.wifi ||
  //       result == ConnectivityResult.ethernet ||
  //       result == ConnectivityResult.bluetooth) {
  //     _connectivityActions(true);
  //     return true;
  //   }
  //   _connectivityActions(false);
  //   return false;
  // }

  // void _connectivityActions(bool isInternetConnected) {
  //   if (isInternetConnected) {
  //     if (Get.isDialogOpen ?? false) Get.back<dynamic>();
  //     isConnected.value = isInternetConnected;
  //   } else {
  //     CustomDialogWidget.show(
  //       dialogName: 'No Internet Connection',
  //       title: 'No Internet Connection',
  //       child: const Text('Please check your internet connection.'),
  //       isConnected: false,
  //     );
  //     isConnected.value = isInternetConnected;
  //   }
  // }

  // @override
  // void onClose() {
  //   subscription?.cancel();
  //   super.onClose();
  // }
}
