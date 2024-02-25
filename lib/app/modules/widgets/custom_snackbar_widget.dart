// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:get/get.dart';

class CustomSnackbarWidget {
  static Future<void> show(
    String title,
    String message, {
    Color? backgroundColor,
    Color? colorText,
    Widget? child,
  }) async {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor ??
          (Get.isDarkMode
              ? ColorConstants.myDark
              : ColorConstants.primaryColor),
      colorText: colorText ??
          (Get.isDarkMode
              ? ColorConstants.myLightGrey
              : ColorConstants.myWhite),
    );
  }
}
