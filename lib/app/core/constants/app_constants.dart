import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppConstants {
  AppConstants._();

  static List<String> navLabelList = [
    'Home',
    'Add',
    'Distribute',
    'Report',
    'Print',
    'Settings',
    'Help',
  ];

  static List<IconData> navIconList = [
    Icons.home_filled,
    Icons.add_circle,
    Icons.mediation_rounded,
    Icons.insert_chart_rounded,
    Icons.print,
    Icons.settings,
    Icons.help_rounded,
  ];

  //! Padding
  static final paddingSmall = Padding(padding: EdgeInsets.all(Get.width * .01));
  static final paddingMedium =
      Padding(padding: EdgeInsets.all(Get.width * .02));
  static final paddingNormal =
      Padding(padding: EdgeInsets.all(Get.width * .03));
  static final paddingLarge = Padding(padding: EdgeInsets.all(Get.width * .05));

  static final horizontalPaddingSmall =
      Padding(padding: EdgeInsets.symmetric(horizontal: Get.width * .003));
  static final horizontalPaddingMedium =
      Padding(padding: EdgeInsets.symmetric(horizontal: Get.width * .02));
  static final horizontalPaddingNormal =
      Padding(padding: EdgeInsets.symmetric(horizontal: Get.width * .03));
  static final horizontalPaddingLarge =
      Padding(padding: EdgeInsets.symmetric(horizontal: Get.width * .05));

  static final verticalPaddingSmall =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.width * .01));
  static final verticalPaddingMedium =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.width * .02));
  static final verticalPaddingNormal =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.width * .03));
  static final verticalPaddingLarge =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.width * .05));
}
