import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `class OnboardController` is a class that extends the `GetxController` class. This means that
/// `OnboardController` is a controller class that can be used with the GetX package in Flutter.
/// Controllers are used to manage the state and logic of a specific part of the application. In this
/// case, the `OnboardController` is responsible for managing the state and logic related to the
/// onboarding process.
class OnboardController extends GetxController {
  final _pageIndex = 0.obs;

  ///
  int get pageIndex => _pageIndex.value;
  set pageIndex(int value) => _pageIndex.value = value;

  ///
  final focus = FocusNode();

  ///
  final serchBoxFocus = false.obs;

  @override
  void onInit() {
    pageIndex = 0;
    focus.addListener(onFocusChange);
    super.onInit();
  }

  @override
  void onClose() {
    focus
      ..removeListener(onFocusChange)
      ..dispose();
    super.onClose();
  }

  ///
  void onFocusChange() => serchBoxFocus.value = focus.hasFocus;
}
