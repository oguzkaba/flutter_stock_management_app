import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_iconbutton.dart';

import '../../core/constants/colors_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final FocusNode? focusNode;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool? obsecureText;
  final VoidCallback? onPressed;
  final Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.fillColor,
    this.focusNode,
    required this.prefixIconData,
    this.suffixIconData,
    this.onSubmitted,
    this.obsecureText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIconData,
                color: ColorConstants.myMediumGrey, size: 18),
            suffixIcon:
                CustomIconButton(iconData: suffixIconData, onTap: onPressed),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 12,
                color: ColorConstants.myMediumGrey.withOpacity(.4)),
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }
}
