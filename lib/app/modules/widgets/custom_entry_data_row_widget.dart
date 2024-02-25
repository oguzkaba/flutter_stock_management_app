// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_icon_button_widget.dart';
import 'package:get/get.dart';

class CustomEntryDataRowWidget extends StatelessWidget {
  const CustomEntryDataRowWidget({
    required this.dataName,
    this.data,
    super.key,
    this.enabled = true,
    this.onChange,
    this.formatter,
    this.suffixIconData,
    this.iconTap,
    this.maxLines,
    this.dataChild,
  });
  final Widget? dataChild;
  final TextInputFormatter? formatter;
  final String? data;
  final String dataName;
  final bool enabled;
  final ValueChanged<String>? onChange;
  final IconData? suffixIconData;
  final VoidCallback? iconTap;
  final int? maxLines;

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
            constraints: BoxConstraints(
              maxHeight: maxLines == null ? 36 : 72,
              maxWidth: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: dataChild ??
                  TextField(
                    key: UniqueKey(),
                    minLines: 1,
                    maxLines: maxLines ?? 1,
                    inputFormatters: [
                      formatter ?? FilteringTextInputFormatter.deny(''),
                    ],
                    onSubmitted: onChange,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    controller: TextEditingController(text: data),
                    readOnly: !enabled,
                    decoration: InputDecoration(
                      suffixIcon: CustomIconButton(
                        iconData: suffixIconData,
                        onTap: iconTap,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      enabled: enabled,
                      border: const OutlineInputBorder(),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
