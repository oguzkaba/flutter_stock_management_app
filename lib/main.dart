import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/themes/theme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.instance.lightTheme,
    ),
  );
}
