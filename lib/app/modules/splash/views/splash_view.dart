// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            AppConstants.verticalPaddingSmall,
            const SizedBox(
              width: 64,
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
