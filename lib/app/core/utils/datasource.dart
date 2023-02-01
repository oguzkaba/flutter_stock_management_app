import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../modules/home/controllers/home_controller.dart';

class GridDataSource extends DataGridSource {
  List<DataGridRow> _employeeData = [];

  /// Creates the employee data source class with required details.
  GridDataSource(HomeController controller) {
    _employeeData = controller.dataRow.value
        .map((rows) => DataGridRow(
            cells: rows
                .map((e) => DataGridCell(
                    columnName: controller.dataColumn.map((c) => c).toString(),
                    value: e!.value.toString()))
                .toList()))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString(),
            style: Theme.of(Get.context!).textTheme.bodySmall,
            softWrap: false,
            overflow: TextOverflow.ellipsis),
      );
    }).toList());
  }
}
