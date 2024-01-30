import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';

/// The `class CustomDivider extends StatelessWidget` is creating a custom widget called `CustomDivider`
/// that extends the `StatelessWidget` class. This custom widget is used to display a divider with a
/// specific thickness and color.
class CustomDivider extends StatelessWidget {
  ///
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: ColorConstants.myBlack,
    );
  }
}
