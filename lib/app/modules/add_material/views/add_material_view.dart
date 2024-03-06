import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/utils/datagrid.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/widgets/add_new_report_widget.dart';
import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dropdownmenu_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_filled_icon_button_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Add Material View
class AddMaterialView extends GetView<AddMaterialController> {
  ///
  const AddMaterialView({super.key});
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<SfDataGridState>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: _reportSelectAndInfo(context),
                ),
                Expanded(
                  flex: 7,
                  child: _reportView(key),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _reportView(GlobalKey<SfDataGridState> key) {
    return Card(
      child: SizedBox.expand(
        child: controller.selectReport.value != null
            ? Column(
                children: [
                  Visibility(
                    visible: controller.selectReport.value?.isActive ?? false,
                    child: Expanded(
                      child: Row(
                        children: [
                          AppConstants.horizontalPaddingSmall,
                          const Text('Material Operations: '),
                          AppConstants.horizontalPaddingSmall,
                          _addMaterialSection(),
                          AppConstants.horizontalPaddingSmall,
                          _editMaterialSection(),
                          AppConstants.horizontalPaddingSmall,
                          _deleteMaterialSection(),
                          const Spacer(),
                          _importMaterialsSection(),
                          AppConstants.horizontalPaddingSmall,
                          _exportMaterialsSection(key),
                          AppConstants.horizontalPaddingSmall,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Get.find<HomeController>().isLoading.value
                        ? LinearProgressIndicator(
                            backgroundColor: ColorConstants.secondaryColor,
                            color: ColorConstants.skyBlue,
                          )
                        : DataGridWidget(
                            datagridKey: key,
                            data: Get.find<HomeController>()
                                .allMaterialList
                                .where(
                                  (element) =>
                                      element.truckNo?.padLeft(4, '0') ==
                                      controller.selectReport.value?.repNo
                                          .substring(3),
                                )
                                .toList(),
                            dataColumn: AppConstants.materilDataGridColumn,
                          ),
                  ),
                ],
              )
            : const Center(
                child: Text(
                  'Please select report list to view details...',
                ),
              ),
      ),
    );
  }

  CustomFilledIconButtonWidget _exportMaterialsSection(
    GlobalKey<SfDataGridState> key,
  ) {
    return CustomFilledIconButtonWidget(
      enable: true,
      iconData: Icons.file_upload_outlined,
      onPressed: () async {
        await controller.exportDataGridToExcel(
          key: key,
        );
      },
      label: 'Export',
    );
  }

  CustomFilledIconButtonWidget _importMaterialsSection() {
    return CustomFilledIconButtonWidget(
      enable: true,
      iconData: Icons.file_download_outlined,
      onPressed: () async {
        await controller.importDataGridForExcel();
      },
      label: 'Import',
    );
  }

  CustomFilledIconButtonWidget _deleteMaterialSection() {
    return CustomFilledIconButtonWidget(
      fgColor: ColorConstants.myLightRed,
      bgColor: ColorConstants.myDarkRed,
      enable: true,
      iconData: Icons.delete_rounded,
      onPressed: () {},
      label: 'Delete',
    );
  }

  CustomFilledIconButtonWidget _editMaterialSection() {
    return CustomFilledIconButtonWidget(
      enable: true,
      iconData: Icons.edit_rounded,
      onPressed: () {},
      label: 'Edit',
    );
  }

  CustomFilledIconButtonWidget _addMaterialSection() {
    return CustomFilledIconButtonWidget(
      enable: true,
      iconData: Icons.add_circle_rounded,
      onPressed: () {},
      label: 'Add',
    );
  }

  Card _reportSelectAndInfo(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _selectReportSection(),
          _addReportOpenDilogSection(),
          AppConstants.horizontalPaddingSmall,
          _editReportOpenDilogSection(),
          AppConstants.horizontalPaddingSmall,
          _saveReportOpenDilogSection(),
          AppConstants.horizontalPaddingSmall,
          _printReportOpenDilogSection(),
          AppConstants.horizontalPaddingSmall,
          _closeReportSection(),
          const Spacer(),
          _reportDetails(context),
          AppConstants.horizontalPaddingSmall,
        ],
      ),
    );
  }

  CustomDropdownMenuWidget _selectReportSection() {
    return CustomDropdownMenuWidget(
      textController: controller.textController.value,
      labelText: 'Report Number',
      width: 200,
      dropDownId: 1,
      enabled: true,
      items: controller.reportList.map((e) => e.repNo).toList(),
      itemEnabled: controller.reportList.map((e) => e.isActive).toList(),
      onSelect: (p0) => controller.selectReportNo(p0),
    );
  }

  CustomFilledIconButtonWidget _closeReportSection() {
    return CustomFilledIconButtonWidget(
      fgColor: ColorConstants.myLightRed,
      bgColor: ColorConstants.myDarkRed,
      enable: controller.selectReport.value != null,
      iconData: Icons.cancel_rounded,
      onPressed: () => controller.closeReportList(),
      label: 'Close',
    );
  }

  CustomFilledIconButtonWidget _printReportOpenDilogSection() {
    return CustomFilledIconButtonWidget(
      enable: controller.isReportSelect,
      iconData: Icons.print_rounded,
      onPressed: () {},
      label: 'Print',
    );
  }

  CustomFilledIconButtonWidget _saveReportOpenDilogSection() {
    return CustomFilledIconButtonWidget(
      enable: controller.isReportSelect,
      iconData: Icons.save_rounded,
      onPressed: () {},
      label: 'Save',
    );
  }

  CustomFilledIconButtonWidget _editReportOpenDilogSection() {
    return CustomFilledIconButtonWidget(
      enable: controller.isReportSelect,
      iconData: Icons.edit_note_rounded,
      onPressed: () {},
      label: 'Edit',
    );
  }

  CustomFilledIconButtonWidget _addReportOpenDilogSection() {
    return CustomFilledIconButtonWidget(
      enable: controller.selectReport.value == null,
      iconData: Icons.add_circle,
      onPressed: () {
        CustomDialogWidget.show(
          dialogName: 'AddShipmentReportDialog',
          title: 'Add - Shipment Report',
          child: const AddNewReportWidget(),
          onOk: () {
            Get.back<dynamic>();
          },
          onCancel: () async {
            await CustomDialogWidget.show(
              dialogName: 'CloseShipmentReportDialog',
              title: 'Close Shipment Report !',
              child: const Text(
                'All unsaved data will be lost. Do you want to continue?',
              ),
              onCancel: () => Get.back<dynamic>(),
              onOk: () => Get
                ..back<dynamic>()
                ..back<dynamic>(),
            );
          },
        );
      },
      label: 'Add List',
    );
  }

  Widget _reportDetails(BuildContext context) {
    return Visibility(
      visible: controller.selectReport.value != null,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorConstants.secondaryColor,
                    ),
                text: 'Date: ',
                children: [
                  TextSpan(
                    text: controller.selectReport.value?.repDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            AppConstants.verticalPaddingSmall,
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorConstants.secondaryColor,
                    ),
                text: 'Reported By: ',
                children: [
                  TextSpan(
                    text: controller.selectReport.value?.createdBy,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
