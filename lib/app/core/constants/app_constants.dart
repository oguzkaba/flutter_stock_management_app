// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `class AppConstants` is a utility class that contains
/// various constants and configurations for
/// the application. It includes lists of navigation labels and icons,
/// as well as padding constants for
/// different sizes. These constants can be used throughout the application to
/// maintain consistency and easily make changes in one place.
class AppConstants {
  AppConstants._();

  static List<String> navLabelList = [
    'home'.tr,
    'add'.tr,
    'distribute'.tr,
    'report'.tr,
    'print'.tr,
    'settings'.tr,
    'help'.tr,
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

  static List<String> materilDataGridColumn = [
    'SIRA NO',
    'ARAÇ NO',
    'MALZEMENİN CİNSİ',
    'ÜRÜN TANIMI',
    'RAF NO',
    'DN',
    'ITEM NO',
    'HEAT NO',
    'iRSALİYE ADET',
    'GELEN ADET',
    'İMALATA VERİLEN ADET',
    'SANTİYE SEVK ADET',
    'KALAN ADET',
    'GELİŞ TARİHİ',
    'GELEN FİRMA',
    'SHIPMENT NUMBER',
    'SANDIK NO',
    'KARANTİNA',
    'NOT',
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
      Padding(padding: EdgeInsets.symmetric(vertical: Get.height * .01));
  static final verticalPaddingMedium =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.height * .02));
  static final verticalPaddingNormal =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.height * .03));
  static final verticalPaddingLarge =
      Padding(padding: EdgeInsets.symmetric(vertical: Get.height * .05));

  //! EdgeInsets
  static final edgeInsetsAllSmall = EdgeInsets.all(Get.width * .01);
  static final edgeInsetsAllMedium = EdgeInsets.all(Get.width * .02);
  static final edgeInsetsAllNormal = EdgeInsets.all(Get.width * .03);
  static final edgeInsetsAllLarge = EdgeInsets.all(Get.width * .05);

  static final edgeInsetsHorizontalSmall =
      EdgeInsets.symmetric(horizontal: Get.width * .01);
  static final edgeInsetsHorizontalMedium = EdgeInsets.symmetric(
    horizontal: Get.width * .02,
  );
  static final edgeInsetsHorizontalNormal =
      EdgeInsets.symmetric(horizontal: Get.width * .03);
  static final edgeInsetsHorizontalLarge = EdgeInsets.symmetric(
    horizontal: Get.width * .05,
  );

  static final edgeInsetsVerticalSmall =
      EdgeInsets.symmetric(vertical: Get.height * .01);
  static final edgeInsetsVerticalMedium = EdgeInsets.symmetric(
    vertical: Get.height * .02,
  );
  static final edgeInsetsVerticalNormal =
      EdgeInsets.symmetric(vertical: Get.height * .03);
  static final edgeInsetsVerticalLarge = EdgeInsets.symmetric(
    vertical: Get.height * .05,
  );
}
