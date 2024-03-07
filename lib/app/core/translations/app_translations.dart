// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/translations/en.dart';
import 'package:flutter_stock_management_app/app/core/translations/tr.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  AppTranslations._();
  static final AppTranslations _instance = AppTranslations._();
  static AppTranslations get instance => _instance;
  final locale = Get.deviceLocale;
  final fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
      };
}
