// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CustomFilledIconButtonWidget extends StatelessWidget {
  const CustomFilledIconButtonWidget({
    required this.enable,
    required this.iconData,
    required this.onPressed,
    required this.label,
    super.key,
  });

  final IconData iconData;
  final bool enable;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: enable ? onPressed : null,
      icon: Icon(iconData),
      label: Text(label),
    );
  }
}
