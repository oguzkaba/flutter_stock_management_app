// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The `class LoginController` is extending the `GetxController` class. This means that
/// `LoginController` inherits all the properties and methods of the `GetxController` class.
class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _visiblePass = true.obs;
  final _rememberMe = true.obs;
  final _isLoading = false.obs;
  final _isEmailValid = true.obs;
  final _isPassValid = true.obs;

  /// Getters
  bool get visiblePass => _visiblePass.value;
  bool get rememberMe => _rememberMe.value;
  bool get isLoading => _isLoading.value;

  void toggleVisible() => _visiblePass.value = !_visiblePass.value;
  void toggleRememberMe() => _rememberMe.value = !_rememberMe.value;
  void toggleLoading() => _isLoading.value = !_isLoading.value;

  double getFormHeight() {
    if (_isEmailValid.value && _isPassValid.value) {
      return 300;
    } else if (_isEmailValid.value || _isPassValid.value) {
      return 320;
    } else {
      return 340;
    }
  }

  String? validateEmailTextField(String? value) {
    if (value == null || value.isEmpty) {
      _isEmailValid.value = false;
      return 'email_is_required'.tr;
    }
    if (!GetUtils.isEmail(value)) {
      _isEmailValid.value = false;
      return 'invalid_email'.tr;
    }
    _isEmailValid.value = true;
    return null;
  }

  String? validatePasswordTextField(String? value) {
    if (value == null || value.isEmpty) {
      _isPassValid.value = false;
      return 'password_is_required'.tr;
    }
    if (value.length < 6) {
      _isPassValid.value = false;
      return 'short_password'.tr;
    }
    _isPassValid.value = true;
    return null;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) await loginSupabase();
  }

  Future<void> loginSupabase() async {
    _isLoading.value = true;
    try {
      await SupabaseService.instance
          .signinWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        if (value.user != null) Get.offAllNamed<dynamic>(Routes.DASHBOARD);
      });
    } on AuthException catch (e) {
      await CustomSnackbarWidget.show(
        'error'.tr,
        e.message,
        backgroundColor: ColorConstants.myDarkRed,
        colorText: ColorConstants.myLightRed,
      );
    } on TimeoutException catch (e) {
      await CustomSnackbarWidget.show(
        'error'.tr,
        e.toString(),
        backgroundColor: ColorConstants.myDarkRed,
        colorText: ColorConstants.myLightRed,
      );
    } catch (e) {
      await CustomSnackbarWidget.show(
        'error'.tr,
        'unexpected_error_occurred'.tr,
        backgroundColor: ColorConstants.myDarkRed,
        colorText: ColorConstants.myLightRed,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
