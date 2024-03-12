import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors_constants.dart';

/// The `CustomIconButton` class is a custom widget in Flutter that extends the `StatelessWidget` class.
/// It represents a button with an icon that can be tapped. It takes in parameters such as `iconData`
/// (the icon to be displayed), `onTap` (the callback function to be executed when the button is
/// tapped), and `color` (the color of the icon). The `build` method of this class returns a
/// `GestureDetector` widget with an `Icon` widget as its child.
class CustomIconButton extends StatelessWidget {
  ///
  const CustomIconButton({
    required this.iconData,
    required this.onTap,
    super.key,
    this.color,
  });

  ///
  final IconData? iconData;

  ///
  final VoidCallback? onTap;

  ///
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        iconData,
        size: 20,
        color: color ??
            (Get.isDarkMode
                ? ColorConstants.myWhite
                : ColorConstants.myMediumGrey),
        weight: 10,
      ),
    );
  }
}
