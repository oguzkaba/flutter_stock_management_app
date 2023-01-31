import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors_constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onTap;
  final Color? color;
  const CustomIconButton(
      {super.key, required this.iconData, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(iconData,
          size: 20,
          color: color ??
              (Get.isDarkMode
                  ? ColorConstants.myWhite
                  : ColorConstants.myMediumGrey),
          weight: 10),
    );
  }
}
