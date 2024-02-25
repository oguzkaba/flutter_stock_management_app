import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:flutter_stock_management_app/app/core/themes/theme.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      minimumSize: Size(944, 720),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: 'Stocker | Stock Management App',
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // Initialize the theme controller
  final themeController = Get.put(ThemeController());

  await GetStorage.init();
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANONKEY'),
  );

  runApp(
    GetMaterialApp(
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      initialBinding: OnboardBinding(),
      getPages: AppPages.routes,
      theme: AppTheme.instance.lightTheme,
      darkTheme: AppTheme.instance.darkTheme,
      themeMode: themeController.getThemeMode(),
    ),
  );
}
