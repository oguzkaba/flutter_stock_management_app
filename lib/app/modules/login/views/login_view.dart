import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_textfield_widget.dart';
import 'package:get/get.dart';

/// The `class LoginView extends GetView<LoginController>` is defining a Flutter widget that represents
/// the view for the login screen. It extends the `GetView` class from the GetX package, which allows
/// for easy integration of state management using the GetX library.
class LoginView extends GetView<LoginController> {
  ///Constructor
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Obx(
            () => SizedBox(
              width: 440,
              height: controller.getFormHeight(),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png', width: 32),
                      Text(
                        'Stocker',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ),
                      AppConstants.verticalPaddingMedium,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _emailTFSection(),
                          AppConstants.verticalPaddingSmall,
                          _passwordTFSection(),
                          AppConstants.verticalPaddingSmall,
                          _rememberSection(context),
                          AppConstants.verticalPaddingSmall,
                          _loginButtonSection(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ).paddingAll(16),
        ),
      ),
    );
  }

  Widget _emailTFSection() {
    return KeyboardListener(
      focusNode: controller.emailFocusNode,
      onKeyEvent: (event) async {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          await controller.login();
        }
      },
      child: CustomTextField(
        onChanged: (value) => controller.validateEmailTextField(value),
        controller: controller.emailController,
        validator: (value) => controller.validateEmailTextField(value),
        fillColor: ColorConstants.myWhite,
        hintText: 'Email',
        prefixIconData: Icons.person,
      ),
    );
  }

  Widget _passwordTFSection() {
    return KeyboardListener(
      focusNode: controller.passwordFocusNode,
      onKeyEvent: (event) async {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          await controller.login();
        }
      },
      child: CustomTextField(
        controller: controller.passwordController,
        validator: (value) => controller.validatePasswordTextField(value),
        obsecureText: controller.visiblePass,
        onPressed: () => controller.toggleVisible(),
        iconColor: ColorConstants.myDark,
        suffixIconData: controller.visiblePass
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded,
        fillColor: ColorConstants.myWhite,
        hintText: 'Password',
        prefixIconData: Icons.lock,
        onChanged: (value) => controller.validatePasswordTextField(value),
      ),
    );
  }

  Row _rememberSection(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: controller.rememberMe,
          onChanged: (value) => controller.toggleRememberMe(),
        ),
        Text(
          'Remember me',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
      ],
    );
  }

  SizedBox _loginButtonSection() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton.tonal(
        onPressed: () async =>
            controller.isLoading ? null : await controller.login(),
        child: Text(
          controller.isLoading ? 'Loading...' : 'Login',
        ),
      ),
    );
  }
}
