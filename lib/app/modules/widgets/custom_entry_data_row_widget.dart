// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEntryDataRowWidget extends StatelessWidget {
  const CustomEntryDataRowWidget({
    required this.data,
    required this.dataName,
    super.key,
    this.enabled = true,
    this.onTap,
  });
  final String data;
  final String dataName;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            dataName,
            style: Theme.of(context).textTheme.bodySmall,
          ).paddingOnly(right: 8),
        ),
        Expanded(
          flex: 3,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 36,
              maxWidth: 40,
            ),
            child: TextField(
              onTap: onTap,
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlignVertical: TextAlignVertical.center,
              controller: TextEditingController(text: data),
              readOnly: !enabled,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                enabled: enabled,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
