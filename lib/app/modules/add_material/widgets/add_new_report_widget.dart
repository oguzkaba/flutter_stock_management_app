// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/models/supabase_models/report_model.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/core/utils/utils.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:flutter_stock_management_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_divider_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_entry_data_row_widget.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddNewReportWidget extends StatelessWidget {
  const AddNewReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMaterialController>();
    return Card(
      child: Obx(
        () => SingleChildScrollView(
          child: SizedBox(
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _projectNameSection(controller),
                AppConstants.verticalPaddingSmall,
                _reportNoSection(controller),
                AppConstants.verticalPaddingSmall,
                _reportDateSection(
                  controller,
                  context,
                  'Report Date : ',
                  true,
                ),
                AppConstants.verticalPaddingSmall,
                _reportDateSection(
                  controller,
                  context,
                  'Arrival Date : ',
                  false,
                ),
                AppConstants.verticalPaddingSmall,
                _suppliedBySection(),
                AppConstants.verticalPaddingSmall,
                _truckNoSection(controller),
                AppConstants.verticalPaddingSmall,
                _truckDetailSection(),
                AppConstants.verticalPaddingSmall,
                _remarksSection(),
                AppConstants.verticalPaddingSmall,
                _reportChooseActiveSection(controller),
                const Spacer(),
                const CustomDivider(),
                _createdBySection(context),
              ],
            ).paddingAll(8),
          ),
        ),
      ),
    );
  }

  CustomEntryDataRowWidget _reportChooseActiveSection(
    AddMaterialController controller,
  ) {
    return CustomEntryDataRowWidget(
      dataName: 'Active : ',
      dataChild: Switch.adaptive(
        value: controller.reportIsActive,
        onChanged: (value) => controller.reportIsActive = value,
      ),
    );
  }

  CustomEntryDataRowWidget _remarksSection() {
    return CustomEntryDataRowWidget(
      dataName: 'Remarks : ',
      maxLines: 2,
      onChange: (value) {},
    );
  }

  CustomEntryDataRowWidget _truckDetailSection() {
    return CustomEntryDataRowWidget(
      dataName: 'Truck Detail : ',
      onChange: (value) {},
    );
  }

  CustomEntryDataRowWidget _truckNoSection(AddMaterialController controller) {
    return CustomEntryDataRowWidget(
      dataName: 'Truck No : ',
      data: Utils.calcTruckNumber(
        controller.allReportList,
      ),
      onChange: (value) {},
    );
  }

  CustomEntryDataRowWidget _suppliedBySection() {
    return CustomEntryDataRowWidget(
      dataName: 'Supplied By : ',
      data: 'New Supplier',
      onChange: (value) {},
    );
  }

  CustomEntryDataRowWidget _projectNameSection(
    AddMaterialController controller,
  ) {
    return CustomEntryDataRowWidget(
      data: Get.find<DashboardController>().selectedProject.value?.prjName,
      dataName: 'Project : ',
      enabled: false,
    );
  }

  CustomEntryDataRowWidget _reportNoSection(AddMaterialController controller) {
    return CustomEntryDataRowWidget(
      data: Utils.calcReportNumber(
        controller.allReportList,
      ),
      dataName: 'Report Number : ',
      enabled: false,
    );
  }

  Align _createdBySection(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          text: 'Created By : ',
          children: [
            TextSpan(
              text:
                  SupabaseService.instance.user?.email ?? 'User not logged in',
            ),
          ],
        ),
      ),
    );
  }

  CustomEntryDataRowWidget _reportDateSection(
    AddMaterialController controller,
    BuildContext context,
    String dataName,
    bool enabled,
  ) {
    return CustomEntryDataRowWidget(
      dataName: dataName,
      enabled: enabled,
      formatter: MaskTextInputFormatter(
        mask: 'd#-m#-20##',
        filter: {
          'd': RegExp('[0-3]'),
          'm': RegExp('[0-1]'),
          '#': RegExp('[0-9]'),
        },
      ),
      data: controller.selectDate,
      onChange: (value) => controller.selectDate = value,
      suffixIconData: Icons.calendar_today_rounded,
      iconTap: () => _selectDate(context, controller),
    );
  }

  void _addNewReportMethod(AddMaterialController controller) {
    controller.insertReport(
      newData: reportModelToMap(
        ReportModel(
          repNo: Utils.calcReportNumber(
            controller.allReportList,
          ),
          repDate: Utils.changeDateForDB(controller.selectDate),
          suppliedBy: 'New Supplier',
          truckNo: '5'.padLeft(4, '0'),
          truckDetail: 'New Truck Detail',
          repRemarks: 'New Report',
          arrivalDate: Utils.dateFormatYYYYMMDD(DateTime.now()),
          createdBy:
              SupabaseService.instance.user?.email ?? 'User not logged in',
          createdAt: DateTime.now(),
          isActive: true,
        ),
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    AddMaterialController controller,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.selectDate = Utils.dateFormatDDMMYYYY(picked);
    }
  }
}
