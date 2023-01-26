import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: ColorConstants.myBlack,
    );
  }
}
