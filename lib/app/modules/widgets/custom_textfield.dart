import 'package:flutter/material.dart';

import '../../core/constants/colors_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final FocusNode? focusNode;
  final IconData prefixIconData;
  final Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.fillColor,
    this.focusNode,
    required this.prefixIconData,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIconData,
              color: ColorConstants.myMediumGrey,
              size: 18,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 12,
                color: ColorConstants.myMediumGrey.withOpacity(.4)),
            contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 0),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }
}
