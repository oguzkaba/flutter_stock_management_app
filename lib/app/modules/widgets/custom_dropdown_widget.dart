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
    super.key,
    this.width,
    this.initialSelect,
  });
  final int? initialSelect;
  final bool enabled;
  final String labelText;
  final int dropDownId;
  final double? width;
  final List<String> items;
  final int? Function(int?)? onSelect;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMaterialController>();
    final textController = TextEditingController();
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
        errorText:
            key == const ValueKey('1') ? controller.errorText.value : null,
        hintText: 'Select...',

        label: Text(
          labelText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        width: width ?? 200,
        onSelected: onSelect,

        // onSelected: (value) {
        //   if (value == null) {
        //     controller.disableDropDown(dropDownId.toString());
        //   } else {
        //     controller.enableDropDown(['2', '3', '4', '5', '6']);
        //   }
        // },
        dropdownMenuEntries: items
            .map((e) => DropdownMenuEntry(value: items.indexOf(e), label: e))
            .toList(),
      ),
    );
  }
}
