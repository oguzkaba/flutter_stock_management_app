// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogWidget {
  static Future<void> show({
    required Widget child,
    String? dialogName,
    String? title,
    bool? isConnected = true,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) async {
    await Get.dialog<Widget>(
      PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(title ?? 'Alert Dialog'),
          content: child,
          actions: isConnected ?? true
              ? [
                  TextButton(
                    onPressed: onCancel,
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: onOk,
                    child: const Text('OK'),
                  ),
                ]
              : null,
        ),
      ),
      barrierDismissible: false,
      name: dialogName,
    );
  }
}
