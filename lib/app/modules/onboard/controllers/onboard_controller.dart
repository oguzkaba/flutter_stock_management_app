import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final pageIndex = 0.obs;
  final focus = FocusNode();
  final serchBoxFocus = false.obs;

  @override
  void onInit() {
    pageIndex.value = 0;
    focus.addListener(onFocusChange);
    super.onInit();
  }

  @override
  void onClose() {
    focus.removeListener(onFocusChange);
    focus.dispose();
    super.onClose();
  }

  void onFocusChange() => serchBoxFocus.value = focus.hasFocus;

  void setPageIndex(int index) => pageIndex.value = index;
}
