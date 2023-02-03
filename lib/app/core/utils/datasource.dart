import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/datagrid_controller.dart';

class GridDataSource extends DataGridSource {
  List<DataGridRow> _employeeData = [];

  /// Creates the employee data source class with required details.
  GridDataSource(DatagridController controller) {
    _employeeData = controller.dummyData
        .map((rows) => DataGridRow(
            cells: rows
                .map((e) => DataGridCell<dynamic>(
                    columnName: 'ARAÇ NO', value: e == null ? '-' : e.value))
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
            softWrap: false, overflow: TextOverflow.ellipsis),
      );
    }).toList());
  }
}
