import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_icon_button_widget.dart';
import 'package:get/get.dart';

/// The CustomTextField class is a stateless widget in Dart.
class CustomTextField extends StatelessWidget {
  /// The code you provided is defining a constructor
  /// for the `CustomTextField` class.
  const CustomTextField({
    required this.hintText,
    required this.fillColor,
    required this.prefixIconData,
    this.controller,
    super.key,
    this.focusNode,
    this.suffixIconData,
    this.onSubmitted,
    this.obsecureText,
    this.onPressed,
    this.iconColor,
    this.errorText,
  });

  /// These are the properties of the `CustomTextField` class.
  final String hintText;

  /// These are the properties of the `CustomTextField` class.
  final Color fillColor;

  /// These are the properties of the `CustomTextField` class.
  final FocusNode? focusNode;

  /// These are the properties of the `CustomTextField` class.
  final IconData prefixIconData;

  /// These are the properties of the `CustomTextField` class.
  final IconData? suffixIconData;

  /// These are the properties of the `CustomTextField` class.
  final bool? obsecureText;

  /// These are the properties of the `CustomTextField` class.
  final Color? iconColor;

  /// These are the properties of the `CustomTextField` class.
  final VoidCallback? onPressed;

  /// These are the properties of the `CustomTextField` class.
  final ValueChanged<String>? onSubmitted;

  /// These are the properties of the `CustomTextField` class.
  final TextEditingController? controller;

  /// These are the properties of the `CustomTextField` class.
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      validator: errorText == null ? null : (value) => errorText,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      //onSubmitted: onSubmitted,
      obscureText: obsecureText ?? false,
      style:
          context.textTheme.bodySmall?.copyWith(color: ColorConstants.myDark),
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: Icon(
          prefixIconData,
          color: ColorConstants.myMediumGrey,
          size: 18,
        ),
        suffixIcon: CustomIconButton(
          iconData: suffixIconData,
          onTap: onPressed,
          color: iconColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
          color: ColorConstants.myDark.withOpacity(.4),
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: fillColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
