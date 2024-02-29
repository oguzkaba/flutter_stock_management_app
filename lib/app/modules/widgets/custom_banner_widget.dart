// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:get/get.dart';

class CustomBannerWidget {
  static Future<void> show(
    BuildContext context,
    String title,
    String message, {
    Color? backgroundColor,
    Color? colorText,
    Widget? child,
  }) async {
    ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
            },
            child: const Text('OK'),
          ),
        ],
        backgroundColor: backgroundColor ??
            (Get.isDarkMode
                ? ColorConstants.myDark
                : ColorConstants.primaryColor),
        leading: child,
      ),
    );

    // Get.snackbar(
    //   title,
    //   message,
    //   mainButton: TextButton(
    //     onPressed: Get.closeCurrentSnackbar,
    //     child: const Text('OK'),
    //   ),
    //   snackPosition: SnackPosition.TOP,
    //   backgroundColor: backgroundColor ??
    //       (Get.isDarkMode
    //           ? ColorConstants.myDark
    //           : ColorConstants.primaryColor),
    //   colorText: colorText ??
    //       (Get.isDarkMode
    //           ? ColorConstants.myLightGrey
    //           : ColorConstants.myWhite),
    // );
  }
}
