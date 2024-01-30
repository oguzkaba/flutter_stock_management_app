import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/widgets/add_new_report_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dropdown_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_filled_icon_button_widget.dart';
import 'package:get/get.dart';

/// Add Material View
class AddMaterialView extends GetView<AddMaterialController> {
  ///
  const AddMaterialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: _reportSelectAndInfo(context),
              ),
              const Expanded(
                flex: 5,
                child: Card(
                  child: SizedBox.expand(
                    child: Center(
                      child:
                          Text('Please select truck list to view details...'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _reportSelectAndInfo(BuildContext context) {
    return Card(
      child: SizedBox(
        width: Get.width,
        child: Row(
          children: [
            CustomDropDownWidget(
              textController: controller.textController.value,
              labelText: 'Truck Number',
              width: 280,
              dropDownId: 1,
              enabled: true,
              //TO-DO: Add Material Truck List
              items: const [
                'Truck-0001',
                'Truck-0002',
                'Truck-0003',
                'Truck-0004',
                'Truck-0005',
              ],
              onSelect: (p0) => controller.selectTruck.value = p0,
            ),
            CustomFilledIconButtonWidget(
              enable: controller.selectTruck.value == null,
              iconData: Icons.add_circle,
              onPressed: () {
                CustomDialogWidget.show(
                  dialogName: 'AddNewReportDialog',
                  title: 'Add New Report',
                  child: const AddNewReportWidget(),
                  onOk: () {},
                );
              },
              label: 'Add List',
            ),
            AppConstants.horizontalPaddingSmall,
            CustomFilledIconButtonWidget(
              enable: controller.selectTruck.value != null,
              iconData: Icons.edit_note_rounded,
              onPressed: () {},
              label: 'Edit List',
            ),
            AppConstants.horizontalPaddingSmall,
            CustomFilledIconButtonWidget(
              enable: controller.selectTruck.value != null,
              iconData: Icons.save_rounded,
              onPressed: () {},
              label: 'Save List',
            ),
            AppConstants.horizontalPaddingSmall,
            CustomFilledIconButtonWidget(
              enable: controller.selectTruck.value != null,
              iconData: Icons.print_rounded,
              onPressed: () {},
              label: 'Print List',
            ),
            AppConstants.horizontalPaddingSmall,
            CustomFilledIconButtonWidget(
              fgColor: ColorConstants.myLightRed,
              bgColor: ColorConstants.myDarkRed,
              enable: controller.selectTruck.value != null,
              iconData: Icons.cancel_rounded,
              onPressed: () {
                controller.selectTruck.value = null;
                controller.textController.value.clear();
              },
              label: 'Close List',
            ),
            const Spacer(),
            _reportDetails(context),
            AppConstants.horizontalPaddingSmall,
          ],
        ),
      ),
    );
  }

  Visibility _reportDetails(BuildContext context) {
    return Visibility(
      visible: controller.selectTruck.value != null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              text: 'Date: ',
              children: const [
                TextSpan(
                  text: '24.01.2024',
                ),
              ],
            ),
          ),
          AppConstants.verticalPaddingSmall,
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              text: 'Reported By: ',
              children: const [
                TextSpan(
                  text: 'oguzkaba',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
