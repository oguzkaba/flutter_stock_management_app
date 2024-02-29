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
  LoginView({super.key});

  /// The `final formKey` is a `GlobalKey` that is used to identify the `Form` widget in the widget tree.
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    return Scaffold(
      body: Center(
        child: Card(
          child: SizedBox(
            width: 440,
            height: controller.showError ? 360 : 300,
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Obx(
                  () => Column(
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
                          _emailTFSection(
                            passwordController: passwordController,
                            emailController: emailController,
                            emailFN: emailFocusNode,
                          ),
                          AppConstants.verticalPaddingSmall,
                          _passwordTFSection(
                            passwordController: passwordController,
                            emailController: emailController,
                            passFN: passwordFocusNode,
                          ),
                          AppConstants.verticalPaddingSmall,
                          _rememberSection(context),
                          AppConstants.verticalPaddingSmall,
                          _loginButtonSection(
                            emailController,
                            passwordController,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ).paddingAll(12),
        ),
      ),
    );
  }

  Widget _emailTFSection({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required FocusNode emailFN,
  }) {
    return KeyboardListener(
      focusNode: emailFN,
      onKeyEvent: (event) async {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          await _loginMethod(emailController, passwordController);
        }
      },
      child: CustomTextField(
        onChanged: (value) => controller.validateEmailTextField(value),
        controller: emailController,
        validator: (value) => controller.validateEmailTextField(value),
        fillColor: ColorConstants.myWhite,
        hintText: 'Email',
        prefixIconData: Icons.person,
      ),
    );
  }

  Widget _passwordTFSection({
    required TextEditingController passwordController,
    required TextEditingController emailController,
    required FocusNode passFN,
  }) {
    return KeyboardListener(
      focusNode: passFN,
      onKeyEvent: (event) async {
        if (event.logicalKey == LogicalKeyboardKey.enter) {
          await _loginMethod(emailController, passwordController);
        }
      },
      child: CustomTextField(
        controller: passwordController,
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

  Future<void> _loginMethod(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (formKey.currentState!.validate()) {
      await controller.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
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

  SizedBox _loginButtonSection(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton.tonal(
        onPressed: () async => controller.isLoading
            ? null
            : await _loginMethod(emailController, passwordController),
        child: Text(
          controller.isLoading ? 'Loading...' : 'Login',
        ),
      ),
    );
  }
}
