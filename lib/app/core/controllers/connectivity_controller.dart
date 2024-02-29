// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  static ConnectivityController get to => Get.find<ConnectivityController>();
  StreamSubscription<ConnectivityResult>? subscription;

  Future<void> initialize() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    subscription =
        Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  final isConnected = false.obs;

  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      _connectivityActions(false);
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.bluetooth) {
      _connectivityActions(true);
      return true;
    }
    _connectivityActions(false);
    return false;
  }

  void _connectivityActions(bool isInternetConnected) {
    if (isInternetConnected) {
      if (Get.isDialogOpen ?? false) Get.back<bool>();
      isConnected.value = isInternetConnected;
    } else {
      CustomDialogWidget.show(
        dialogName: 'No Internet Connection',
        title: 'No Internet Connection',
        child: const Text('Please check your internet connection.'),
        isConnected: false,
      );
      isConnected.value = isInternetConnected;
    }
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
