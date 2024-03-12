import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import '../../modules/widgets/custom_dialog_widget.dart';

/// The `WindowController` class is a controller class that extends the `GetxController` class and
/// implements the `WindowListener` interface.
class WindowController extends GetxController with WindowListener {
  @override
  void onInit() {
    if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
      windowManager.addListener(this);
      _init();
    }

    super.onInit();
  }

  Future<void> _init() async {
    await windowManager.setPreventClose(true);
  }

  @override
  Future<void> onWindowClose() async {
    final isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && !Get.isDialogOpen!) {
      await CustomDialogWidget.show(
        dialogName: 'ExitAppDialog',
        title: 'Exit the application !',
        child: const Text(
          'All unsaved data will be lost. Do you want to continue?',
        ),
        onCancel: () => Get.back<dynamic>(),
        onOk: () async {
          await windowManager.destroy();
        },
      );
    }
  }

  @override
  void onClose() {
    windowManager.removeListener(this);
    super.onClose();
  }
}
