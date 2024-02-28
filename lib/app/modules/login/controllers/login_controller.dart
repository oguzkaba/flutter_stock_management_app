// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The `class LoginController` is extending the `GetxController` class. This means that
/// `LoginController` inherits all the properties and methods of the `GetxController` class.
class LoginController extends GetxController {
  final _visiblePass = true.obs;
  final _rememberMe = true.obs;
  final _showErrorEmail = true.obs;
  final _showErrorPass = true.obs;
  final _isLoading = false.obs;
  final _redirecting = false.obs;
  final _supabase = SupabaseService.instance;
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void onInit() {
    _authStateSubscription = _supabase.onAuthStateChange((state) {
      if (_redirecting.value) return;
      final session = state.session;
      if (session != null) {
        _redirecting.value = true;
        Get.offNamed<dynamic>(Routes.ONBOARD);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _authStateSubscription.cancel();
  }

  /// Getters
  bool get visiblePass => _visiblePass.value;
  bool get rememberMe => _rememberMe.value;
  bool get isLoading => _isLoading.value;
  bool get redirecting => _redirecting.value;
  bool get showError => _showErrorEmail.value || _showErrorPass.value;

  /// The `toggleVisible` method is used to toggle the visibility of the password.
  void toggleVisible() => _visiblePass.value = !_visiblePass.value;
  void toggleRememberMe() => _rememberMe.value = !_rememberMe.value;
  void toggleLoading() => _isLoading.value = !_isLoading.value;
  void toggleRedirecting() => _redirecting.value = !_redirecting.value;

  String? validateEmailTextField(String value) {
    if (value.isEmpty) {
      _showErrorEmail.value = true;
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      _showErrorEmail.value = true;
      return 'Invalid email';
    }
    _showErrorEmail.value = false;
    return null;
  }

  String? validatePasswordTextField(String value) {
    if (value.isEmpty) {
      _showErrorPass.value = true;
      return 'Password is required';
    }
    if (value.length < 6) {
      _showErrorPass.value = true;
      return 'Password must be at least 6 characters long';
    }
    _showErrorPass.value = false;
    return null;
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await SupabaseService.instance
          .signinWithEmail(email: email, password: password)
          .then((value) {
        value.user != null
            ? Get.offNamed<dynamic>(Routes.ONBOARD)
            : Get.snackbar('Error', 'Invalid email or password');
      });
    } catch (e) {
      await CustomSnackbarWidget.show(
        'Error',
        'Unexpected error occurred',
        backgroundColor: ColorConstants.myDarkRed,
        colorText: ColorConstants.myLightRed,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
