// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The `class LoginController` is extending the `GetxController` class. This means that
/// `LoginController` inherits all the properties and methods of the `GetxController` class.
class LoginController extends GetxController {
  final _visiblePass = true.obs;
  final _rememberMe = true.obs;

  @override
  void onClose() {}

  /// The `bool get visiblePass` is a getter method that returns the value of the `_visiblePass`
  /// variable. It allows other parts of the code to access the value of `_visiblePass` without directly
  /// accessing the variable itself.
  bool get visiblePass => _visiblePass.value;
  bool get rememberMe => _rememberMe.value;

  /// The `void toggleVisible()` method is a function that toggles the value of the `_visiblePass`
  /// variable. It uses the `.value` property of the `RxBool` object `_visiblePass` to access and modify
  /// its value. When called, it will change the value of `_visiblePass` from `true` to `false` or from
  /// `false` to `true`.
  void toggleVisible() => _visiblePass.value = !_visiblePass.value;
  void toggleRememberMe() => _rememberMe.value = !_rememberMe.value;

  String? validateEmailTextField(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? validatePasswordTextField(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await SupabaseService.instance
          .signinWithEmail(email: email, password: password)
          .then((value) {
        value.user != null
            ? Get.offNamed<dynamic>(Routes.DASHBOARD)
            : Get.snackbar('Error', 'Invalid email or password');
      });
    } catch (e) {
      e as AuthException;
      Get.snackbar('Error', e.message);
    }
  }
}
