import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/datagrid_controller.dart';

class GridDataSource extends DataGridSource {
  List<DataGridRow> _employeeData = [];

  /// Creates the employee data source class with required details.
  GridDataSource(DGController controller) {
    _employeeData = controller.dummyData
        .map((rows) => DataGridRow(cells: [
              DataGridCell(
                  columnName: controller.dataColumn[0], value: rows.siraNo),
              DataGridCell(
                  columnName: controller.dataColumn[1], value: rows.aracNo),
              DataGridCell(
                  columnName: controller.dataColumn[2],
                  value: rows.malzemeninCinsi),
              DataGridCell(
                  columnName: controller.dataColumn[3], value: rows.urunTanimi),
              DataGridCell(
                  columnName: controller.dataColumn[4], value: rows.rafNo),
              DataGridCell(
                  columnName: controller.dataColumn[5], value: rows.dn),
              DataGridCell(
                  columnName: controller.dataColumn[6], value: rows.itemNo),
              DataGridCell(
                  columnName: controller.dataColumn[7], value: rows.heatNo),
              DataGridCell(
                  columnName: controller.dataColumn[8], value: rows.adet),
              DataGridCell(
                  columnName: controller.dataColumn[9], value: rows.gelenAdet),
              DataGridCell(
                  columnName: controller.dataColumn[10], value: rows.iadeAdet),
              DataGridCell(
                  columnName: controller.dataColumn[11], value: rows.kalanAdet),
              DataGridCell(
                  columnName: controller.dataColumn[12], value: rows.kalite),
              DataGridCell(
                  columnName: controller.dataColumn[13],
                  value: rows.gelisTarihi),
              DataGridCell(
                  columnName: controller.dataColumn[14],
                  value: rows.gelenFirma.name),
              DataGridCell(
                  columnName: controller.dataColumn[15],
                  value: rows.shipmentNumber),
              DataGridCell(
                  columnName: controller.dataColumn[16], value: rows.sandikNo),
              DataGridCell(
                  columnName: controller.dataColumn[17], value: rows.not),
            ]))
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
