// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:get/get.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
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
  });
  final int? initialSelect;
  final bool enabled;
  final String labelText;
  final String? errorText;
  final int dropDownId;
  final double? width;
  final List<String> items;
  final TextEditingController? textController;
  final int? Function(int?)? onSelect;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMaterialController>();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownMenu(
        initialSelection:
            controller.isEnabledMap[dropDownId.toString()] ?? false
                ? initialSelect
                : null,
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
            .map((e) => DropdownMenuEntry(value: items.indexOf(e), label: e))
            .toList(),
      ),
    );
  }
}
