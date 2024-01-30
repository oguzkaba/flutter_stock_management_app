// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_divider_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_entry_data_row_widget.dart';
import 'package:get/get.dart';

class AddNewReportWidget extends StatelessWidget {
  const AddNewReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMaterialController>();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomEntryDataRowWidget(
            data: 'Truck-0001',
            dataName: 'Truck Number: ',
            enabled: false,
          ),
          AppConstants.verticalPaddingSmall,
          CustomEntryDataRowWidget(
            onTap: () async {
              controller.selectDate.value = await _date(context)
                  .then((value) => value?.toString().substring(0, 10));
            },
            data: controller.selectDate.value ?? 'Select Date',
            dataName: 'Date: ',
          ),
          const Spacer(),
          const CustomDivider(),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              text: 'Created By: ',
              children: const [
                TextSpan(
                  text: 'oguzkaba',
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(8),
    );
  }

  Future<DateTime?> _date(BuildContext context) async {
    return showDatePicker(
      context: context,
      locale: const Locale('tr', 'TR'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
  }
}
