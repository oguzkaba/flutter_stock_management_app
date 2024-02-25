// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:get/get.dart';

class CustomDropdownMenuWidget extends StatelessWidget {
  const CustomDropdownMenuWidget({
    required this.labelText,
    required this.items,
    required this.enabled,
    required this.dropDownId,
    required this.onSelect,
    this.textController,
    super.key,
    this.width,
    this.initialSelect,
    this.errorText,
    this.itemEnabled,
  });
  final int? initialSelect;
  final bool enabled;
  final List<bool>? itemEnabled;
  final String labelText;
  final String? errorText;
  final int dropDownId;
  final double? width;
  final List<String> items;
  final TextEditingController? textController;
  final ValueChanged<int?>? onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownMenu(
        initialSelection: initialSelect,
        key: key,
        controller: textController,
        textStyle: Theme.of(context).textTheme.bodySmall,
        menuHeight: Get.height * 0.6,
        enabled: enabled,
        errorText: errorText,
        hintText: 'Select...',
        label: Text(
          labelText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        width: width ?? 200,
        onSelected: onSelect,
        dropdownMenuEntries: items
            .map(
              (e) => DropdownMenuEntry(
                //enabled: _getItemIsEnabled(e),
                label: _getItemIsEnabled(e) ? e : '$e (Passive)',
                labelWidget: _getItemIsEnabled(e)
                    ? Text(e)
                    : Text(
                        '$e (Passive)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: _getItemIsEnabled(e)
                                  ? null
                                  : ColorConstants.myLightRed,
                            ),
                      ),
                value: items.indexOf(e),
              ),
            )
            .toList(),
      ),
    );
  }

  bool _getItemIsEnabled(String e) {
    if (itemEnabled != null) {
      if (itemEnabled!.isNotEmpty) {
        return itemEnabled![items.indexOf(e)];
      }
    }
    return true;
  }
}
