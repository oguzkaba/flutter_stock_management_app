import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/themes/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.instance.lightTheme,
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
