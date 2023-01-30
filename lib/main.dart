import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/themes/theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.instance.lightTheme,
      darkTheme: AppTheme.instance.darkTheme,
      themeMode: ThemeController().getThemeMode(),
    ),
  );

  // doWhenWindowReady(() {
  //   const initialSize = Size(1024, 768);
  //   appWindow.minSize = initialSize;
  //   // appWindow.maximizeOrRestore();
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.title = "Stock Management";
  //   appWindow.show();
  // });
}
