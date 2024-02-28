// ignore_for_file: public_member_api_docs

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  static ConnectivityController get to => Get.find<ConnectivityController>();
  final isConnected = false.obs;

  @override
  Future<void> onInit() async {
    await Connectivity().checkConnectivity().then((result) {
      isInternetConnected(result);
      Connectivity().onConnectivityChanged.listen(isInternetConnected);
    });

    super.onInit();
  }

  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      _connectivityActions(false);
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
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
    Connectivity().onConnectivityChanged.listen(isInternetConnected).cancel();
    super.onClose();
  }
}
