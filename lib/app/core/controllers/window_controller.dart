import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

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
      await Get.defaultDialog<Widget>(
        title: 'Are you sure you want to close this window?',
        titleStyle: Theme.of(Get.context!).textTheme.titleLarge,
        titlePadding: const EdgeInsets.all(24),
        middleText: '',
        actions: [
          TextButton(
            onPressed: Get.back<dynamic>,
            child: const Text('No'),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              Get.back<dynamic>();
              await windowManager.destroy();
            },
          ),
        ],
      );
    }
  }

  @override
  void onClose() {
    windowManager.removeListener(this);
    super.onClose();
  }
}
