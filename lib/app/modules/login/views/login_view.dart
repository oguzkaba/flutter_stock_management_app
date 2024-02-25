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
          child: SizedBox(
            width: 440,
            height: 300,
            child: SingleChildScrollView(
              child: Obx(
                () => Form(
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
                          CustomTextField(
                            controller: emailController,
                            fillColor: ColorConstants.myWhite,
                            hintText: 'Email',
                            prefixIconData: Icons.person,
                            errorText: controller
                                .validateEmailTextField(emailController.text),
                          ),
                          AppConstants.verticalPaddingSmall,
                          CustomTextField(
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
                          ),
                          AppConstants.verticalPaddingSmall,
                          Row(
                            children: [
                              Checkbox(
                                value: controller.rememberMe,
                                onChanged: (value) =>
                                    controller.toggleRememberMe(),
                              ),
                              Text(
                                'Remember me',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                          AppConstants.verticalPaddingSmall,
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: FilledButton.tonal(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await controller.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Invalid email or password',
                                  );
                                }
                              },
                              child: const Text('Login'),
                            ),
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
}
