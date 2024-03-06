// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final isOnline = false.obs;
  static ConnectivityController get to => Get.find<ConnectivityController>();
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> onInit() async {
    isOnline.value =
        await _connectivity.checkConnectivity() != ConnectivityResult.none;
    connectivityActions();
    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    super.onInit();
  }

  bool _onConnectivityChanged(
    ConnectivityResult connectivityResult,
  ) {
    if (connectivityResult == ConnectivityResult.none) {
      isOnline.value = false;
      connectivityActions();
      return false;
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth) {
      isOnline.value = true;
      connectivityActions();
      return true;
    } else {
      isOnline.value = false;
      connectivityActions();
      return false;
    }
  }

  //TODO:snackbar yerine banner denenecek
  void connectivityActions() {
    if (!isOnline.value) {
      Get
        ..closeAllSnackbars()
        ..rawSnackbar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection.',
          backgroundColor: ColorConstants.myDarkRed,
          isDismissible: false,
          snackStyle: SnackStyle.GROUNDED,
        );
    }
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  ///dialog

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
