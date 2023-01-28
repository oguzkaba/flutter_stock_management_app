import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/extensions/color_extension.dart';

class ColorConstants {
  static Color primaryColor = '0D62AB'.toColor;
  static Color secondaryColor = '199BE2'.toColor;
  static Color skyBlue = '50E6FF'.toColor;
  static Color myYellow = 'FFC107'.toColor;
  static Color myLightRed = 'FFB7B7'.toColor;
  static Color myRed = 'FF0A0A'.toColor;
  static Color myDarkRed = 'B80000'.toColor;
  static Color myDark = '393939'.toColor;
  static Color myWhite = 'FFFFFF'.toColor;
  static Color myBlack = '000000'.toColor;
  static Color myTransparent = '000000'.toColor;
  static Color myLightGrey = 'EEEEEF'.toColor;
  static Color myMediumGrey = '5C5C5C'.toColor;
  static Color shimmerBase = 'E0E0E0'.toColor;
  static Color shimmerHighlight = 'F5F5F5'.toColor;
}

//! Shader Text
final Shader linearGradient = LinearGradient(
  colors: <Color>[
    ColorConstants.skyBlue,
    ColorConstants.secondaryColor,
    ColorConstants.primaryColor,
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 75.0, 50.0));
