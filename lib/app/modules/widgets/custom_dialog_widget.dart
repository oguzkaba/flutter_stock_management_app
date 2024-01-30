// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogWidget {
  static void show(
      {required Widget child,
      String? dialogName,
      String? title,
      VoidCallback? onOk}) {
    Get.dialog<Widget>(
      AlertDialog(
        title: Text(title ?? 'Alert Dialog'),
        content: child,
        actions: [
          TextButton(
            onPressed: Get.back<bool>,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onOk,
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
      name: dialogName,
    );
  }
}
