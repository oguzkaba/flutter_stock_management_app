import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class WindowController extends GetxController with WindowListener {
  static final instance = Get.find();
  @override
  void onInit() {
    if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
      windowManager.addListener(this);
      _init();
    }

    super.onInit();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && !Get.isDialogOpen!) {
      Get.defaultDialog(
        title: 'Are you sure you want to close this window?',
        titleStyle: Theme.of(Get.context!).textTheme.titleLarge,
        titlePadding: EdgeInsets.all(24),
        middleText: '',
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () async {
              Get.back();
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
