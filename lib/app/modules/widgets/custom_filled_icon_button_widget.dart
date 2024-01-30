// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CustomFilledIconButtonWidget extends StatelessWidget {
  const CustomFilledIconButtonWidget({
    required this.enable,
    required this.iconData,
    required this.onPressed,
    required this.label,
    super.key,
    this.bgColor,
    this.fgColor,
  });

  final IconData iconData;
  final bool enable;
  final VoidCallback onPressed;
  final String label;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(
          enable ? bgColor : null,
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(
          enable ? fgColor : null,
        ),
      ),
      onPressed: enable ? onPressed : null,
      icon: Icon(iconData),
      label: Text(label),
    );
  }
}
