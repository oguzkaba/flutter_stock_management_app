// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// The `class ThemeController` is creating a controller
/// class that extends the `GetxController` class.
/// This allows the controller to manage the state and
/// logic related to the theme of the application.
class ThemeController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = 'isDarkmode';

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  Future<void> saveThemeMode({bool? isDarkMode}) async {
    await _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(isDarkMode: !isSavedDarkMode());
  }
}
