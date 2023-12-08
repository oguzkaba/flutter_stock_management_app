// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';

class AppTheme {
  AppTheme._init();

  static AppTheme? _instance;

  // ignore: prefer_constructors_over_static_methods
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

//!  Light Theme

  ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConstants.primaryColor,
          primary: ColorConstants.primaryColor,
        ),
        scaffoldBackgroundColor: ColorConstants.myWhite,
        textTheme: _textThemeLight,
        primaryTextTheme: _primaryTextTheme,
        inputDecorationTheme: _inputTheme,
      );

//!  Dark Theme

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConstants.primaryColor,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B0B0B),
        textTheme: _textThemeDark,
        primaryTextTheme: _primaryTextTheme,
        inputDecorationTheme: _inputTheme,
        cardColor: const Color(0xFF1C1C1C),
      );

  TextTheme get _textThemeLight => ThemeData.light()
      .textTheme
      .copyWith(
        headlineSmall: TextStyle(
          color: ColorConstants.myBlack,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(color: ColorConstants.myMediumGrey),
        labelMedium: TextStyle(
          color: ColorConstants.myBlack,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorConstants.myDark,
        ),
      )
      .apply(
        fontFamily: 'Montserrat',
      );

  TextTheme get _textThemeDark => ThemeData.dark()
      .textTheme
      .copyWith(
        headlineSmall: TextStyle(
          color: ColorConstants.myWhite,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(color: ColorConstants.myLightGrey),
        labelMedium: TextStyle(
          color: ColorConstants.myLightGrey,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorConstants.myWhite,
        ),
      )
      .apply(
        fontFamily: 'Montserrat',
      );

  TextTheme get _primaryTextTheme => ThemeData.light().textTheme.apply(
        fontFamily: 'Montserrat',
      );

  InputDecorationTheme get _inputTheme =>
      InputDecorationTheme(prefixIconColor: ColorConstants.primaryColor);
}
