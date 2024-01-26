import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_textfield.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              width: 400,
              height: 300,
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
                  const SizedBox(height: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        fillColor: ColorConstants.myWhite,
                        hintText: 'Username',
                        prefixIconData: Icons.person,
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => CustomTextField(
                          obsecureText: controller.visiblePass,
                          onPressed: () => controller.toggleVisible(),
                          suffixIconData: controller.visiblePass
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          fillColor: ColorConstants.myWhite,
                          hintText: 'Password',
                          prefixIconData: Icons.lock,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) {},
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
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: FilledButton.tonal(
                          onPressed: () =>
                              Get.offAllNamed<dynamic>(Routes.ONBOARD),
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
      ),
    );
  }
}
