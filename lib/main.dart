import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

import 'app/core/controllers/theme_controller.dart';
import 'app/core/init/init_bindings.dart';
import 'app/core/themes/theme.dart';
import 'app/core/translations/app_translations.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  /// Initialize window manager for desktop
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

  /// Set preferred orientations for mobile
  if (GetPlatform.isMobile) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  /// Initialize GetStorage
  await GetStorage.init();

  /// Load .env file
  await dotenv.load();

  /// Initialize Supabase
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANONKEY'),
  );

  runApp(
    GetMaterialApp(
      title: 'Stocker | Stock Management App',
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      locale: AppTranslations.instance.locale,
      fallbackLocale: AppTranslations.instance.fallbackLocale,
      translations: AppTranslations.instance,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitBindings(),
      getPages: AppPages.routes,
      theme: AppTheme.instance.lightTheme,
      darkTheme: AppTheme.instance.darkTheme,
      themeMode: ThemeController().getThemeMode(),
    ),
  );
}
