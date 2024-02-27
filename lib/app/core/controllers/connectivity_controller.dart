// ignore_for_file: public_member_api_docs

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final isConnected = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      CustomDialogWidget.show(
        dialogName: 'No Internet Connection',
        title: 'No Internet Connection',
        child: const Text('Please check your internet connection.'),
      );
      isConnected.value = false;
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      if (Get.isDialogOpen ?? false) Get.back<bool>();
      isConnected.value = true;
      return true;
    }

    return false;
  }

  @override
  void onClose() {
    Connectivity().onConnectivityChanged.listen(isInternetConnected).cancel();
    super.onClose();
  }
}
