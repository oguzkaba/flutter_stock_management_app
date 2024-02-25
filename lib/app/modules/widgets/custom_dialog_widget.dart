// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogWidget {
  static Future<void> show({
    required Widget child,
    String? dialogName,
    String? title,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) async {
    await Get.dialog<Widget>(
      AlertDialog(
        title: Text(title ?? 'Alert Dialog'),
        content: child,
        actions: [
          TextButton(
            onPressed: onCancel,
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
