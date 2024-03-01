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
    super.key,
    this.focusNode,
    this.suffixIconData,
    this.onChanged,
    this.obsecureText,
    this.onPressed,
    this.iconColor,
    this.validator,
    this.controller,
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
  final ValueChanged<String>? onChanged;

  /// These are the properties of the `CustomTextField` class.
  final String? Function(String?)? validator;

  /// These are the properties of the `CustomTextField` class.
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      obscureText: obsecureText ?? false,
      onChanged: onChanged,
      style:
          context.textTheme.bodySmall?.copyWith(color: ColorConstants.myDark),
      decoration: InputDecoration(
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
