import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: 400,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 32),
                Text('Stocker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient)),
                SizedBox(height: 32),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                        fillColor: ColorConstants.myWhite,
                        hintText: 'Username',
                        prefixIconData: Icons.person),
                    SizedBox(height: 8),
                    CustomTextField(
                        fillColor: ColorConstants.myWhite,
                        hintText: 'Password',
                        prefixIconData: Icons.lock),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text('Remember me',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 10)),
                      ],
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton.tonal(
                          onPressed: () => Get.offAllNamed(Routes.ONBOARD),
                          child: Text('Login')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
