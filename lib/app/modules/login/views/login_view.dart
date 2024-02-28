import 'package:flutter/material.dart';
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
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Card(
          child: Obx(
            () => SizedBox(
              width: 440,
              height: controller.showError ? 360 : 300,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                          _emailTFSection(emailController),
                          AppConstants.verticalPaddingSmall,
                          _passwordTFSection(passwordController),
                          AppConstants.verticalPaddingSmall,
                          _rememberSection(context),
                          AppConstants.verticalPaddingSmall,
                          _loginButtonSection(
                            formKey,
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

  CustomTextField _emailTFSection(TextEditingController emailController) {
    return CustomTextField(
      controller: emailController,
      fillColor: ColorConstants.myWhite,
      hintText: 'Email',
      prefixIconData: Icons.person,
      errorText: controller.validateEmailTextField(emailController.text),
    );
  }

  CustomTextField _passwordTFSection(TextEditingController passwordController) {
    return CustomTextField(
      controller: passwordController,
      obsecureText: controller.visiblePass,
      onPressed: () => controller.toggleVisible(),
      iconColor: ColorConstants.myDark,
      suffixIconData: controller.visiblePass
          ? Icons.visibility_rounded
          : Icons.visibility_off_rounded,
      fillColor: ColorConstants.myWhite,
      hintText: 'Password',
      prefixIconData: Icons.lock,
      errorText: controller.validatePasswordTextField(
        passwordController.text,
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

  SizedBox _loginButtonSection(
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: FilledButton.tonal(
        onPressed: controller.isLoading
            ? null
            : () async {
                if (formKey.currentState!.validate()) {
                  await controller.login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                }
              },
        child: Text(
          controller.isLoading ? 'Loading...' : 'Login',
        ),
      ),
    );
  }
}
