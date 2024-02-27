// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/models/import_excel_data_model.dart';
import 'package:flutter_stock_management_app/app/core/models/supabase_models/report_model.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/core/utils/convert_excel_to_json.dart';
import 'package:flutter_stock_management_app/app/core/utils/datagrid.dart';
import 'package:flutter_stock_management_app/app/core/utils/utils.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';

class AddMaterialController extends GetxController {
  final _supabaseService = SupabaseService.instance;

  /// Rx Variables
  bool isLoading = true;
  final _reportIsActive = true.obs;
  final _reportList = <ReportModel>[].obs;
  final _allReportList = <ReportModel>[].obs;
  final _selectReport = Rxn<ReportModel>();
  final textController = TextEditingController().obs;
  final _errorText = Rxn<String>();
  final _selectDate = Utils.dateFormatDDMMYYYY(DateTime.now()).obs;

  /// Getters
  bool get reportIsActive => _reportIsActive.value;
  Rxn<String> get errorText => _errorText;
  String get selectDate => _selectDate.value;
  List<ReportModel> get reportList => _reportList;
  List<ReportModel> get allReportList => _allReportList;
  Rxn<ReportModel> get selectReport => _selectReport;
  bool get isReportSelect => _selectReport.value != null;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void reportTableRealTime(int filterValue) {
    _supabaseService.subscribeToData(table: 'report').listen(
      (List<Map<String, dynamic>> data) {
        final convertData = reportModelFromJson(data);
        if (!listEquals(_allReportList, convertData)) {
          _allReportList
            ..clear()
            ..value = convertData;
          _reportList.value = _allReportList
              .where((element) => element.prjId == filterValue)
              .toList();
          CustomSnackbarWidget.show(
            'Info',
            'Refreshing the "report" list...',
          );
        }
      },
      onDone: () {
        CustomSnackbarWidget.show(
          'Done',
          'Closing the "report" list...',
        );
      },
      onError: (dynamic error) {
        CustomSnackbarWidget.show(
          'Error',
          '$error, while refreshing the report list...',
        );
      },
    );
  }

  set reportIsActive(bool value) => _reportIsActive.value = value;

  set selectDate(String value) => _selectDate.value = value;

  Future<void> insertReport({required Object newData}) async {
    await _supabaseService.insertData(table: 'report', model: newData);
  }

  void selectReportNo(int? p0) {
    if (p0 != null) {
      _selectReport.value = _reportList[p0];
    } else {
      _selectReport.value = null;
    }
  }

  void closeReportList() {
    selectReport.value = null;
    textController.value.clear();
  }

  Future<void> exportDataGridToExcel({
    required GlobalKey<SfDataGridState> key,
  }) async {
    final workbook = key.currentState!.exportToExcelWorkbook();
    final bytes = workbook.saveAsStream();
    await File('material-list.xlsx').writeAsBytes(bytes);
    workbook.dispose();
  }

  Future<List<ImportDataModel>?> importDataGridForExcel() async {
    isLoading = true;
    final datagridKey = GlobalKey<SfDataGridState>();
    final data = await ExcelToJson.convertToJSON();
    if (data?.first.siraNo != null) {
      await CustomSnackbarWidget.show(
        'Success',
        'Data imported successfully!',
      );
      isLoading = false;
      await CustomDialogWidget.show(
        dialogName: 'ImportDataPreviewDialog',
        title: 'Import Data Preview',
        child: SizedBox(
          width: Get.width * 0.8,
          height: Get.height * 0.8,
          child: isLoading
              ? LinearProgressIndicator(
                  backgroundColor: ColorConstants.secondaryColor,
                  color: ColorConstants.skyBlue,
                )
              : DataGridWidget(
                  datagridKey: datagridKey,
                  data: importDataModelToMaterialsModel(data ?? []),
                  dataColumn: AppConstants.materilDataGridColumn,
                ),
        ),
        onOk: () => Get.back<bool>(),
        onCancel: () => Get.back<bool>(),
      );
    } else {
      await CustomSnackbarWidget.show(
        'ERROR!',
        'Data not imported!',
        colorText: ColorConstants.myLightRed,
        backgroundColor: ColorConstants.myDarkRed,
      );
    }
    return data;
  }
}
