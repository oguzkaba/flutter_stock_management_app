import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dropdown_widget.dart';
import 'package:get/get.dart';

/// Add Material View
class AddNewMaterialWidget extends GetView<AddMaterialController> {
  ///
  const AddNewMaterialWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Card(
                  child: SizedBox(
                    width: Get.width,
                    child: Wrap(
                      children: [
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('1'),
                          dropDownId: 1,
                          enabled: true,
                          items: controller.materialTypeList
                              .map((e) => e.name)
                              .toList(),
                          labelText: 'Material Type',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('2'),
                          dropDownId: 2,
                          enabled: controller.isEnabledMap['2']!,
                          items: const ['1"', '2"', '3"'],
                          labelText: 'Property-1',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('3'),
                          dropDownId: 3,
                          enabled: controller.isEnabledMap['3']!,
                          items: const ['1"', '2"', '3"'],
                          labelText: 'Property-2',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('4'),
                          dropDownId: 4,
                          enabled: controller.isEnabledMap['4']!,
                          items: const ['1"', '2"', '3"'],
                          labelText: 'Property-3',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('5'),
                          dropDownId: 5,
                          enabled: controller.isEnabledMap['5']!,
                          items: const ['1"', '2"', '3"'],
                          labelText: 'Property-4',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('6'),
                          dropDownId: 6,
                          enabled: controller.isEnabledMap['6']!,
                          items: const ['ASTM A420', 'ASTM A403', 'ASTM A234'],
                          labelText: 'Mat. Std.',
                        ),
                        CustomDropDownWidget(
                          onSelect: null,
                          key: const ValueKey('7'),
                          dropDownId: 7,
                          enabled: controller.isEnabledMap['7']!,
                          items: const ['WPL3', 'WPL6', 'WPL9'],
                          labelText: 'Mat. Quality',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Card(
                  child: SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
