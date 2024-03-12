// ignore_for_file: sort_constructors_first, public_member_api_docs, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/models/supabase_models/material_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridDataSource extends DataGridSource {
  TextEditingController editingController = TextEditingController();
  dynamic newCellValue;
  List<DataGridRow> _employeeData = [];

  /// Creates the employee data source class with required details.
  GridDataSource(List<MaterialsModel> data, List<String> dataColumn) {
    _employeeData = data
        .map(
          (MaterialsModel rows) => DataGridRow(
            cells: [
              DataGridCell(
                columnName: dataColumn[0],
                value: rows.seqNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[1],
                value: rows.truckNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[2],
                value: rows.matType ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[3],
                value: rows.description ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[4],
                value: rows.shelfNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[5],
                value: rows.diameter ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[6],
                value: rows.itemNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[7],
                value: rows.heatNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[8],
                value: rows.recQty ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[9],
                value: rows.inQty ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[10],
                value: rows.manQty ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[11],
                value: rows.consQty ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[12],
                value: rows.remQty ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[13],
                value: rows.arrivalDate ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[14],
                value: rows.inCompany ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[15],
                value: rows.shippNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[16],
                value: rows.boxNo ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[17],
                value: rows.quarantine ?? '',
              ),
              DataGridCell(
                columnName: dataColumn[18],
                value: rows.note ?? '',
              ),
            ],
          ),
        )
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
          padding: const EdgeInsets.all(8),
          child: Text(
            e.value.toString(),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }

  //TO-DO: Implement the following methods to enable editing

  // @override
  // Widget? buildEditWidget(
  //   DataGridRow dataGridRow,
  //   RowColumnIndex rowColumnIndex,
  //   GridColumn column,
  //   void Function() submitCell,
  // ) {
  //   // To set the value for TextField when cell is moved into edit mode.
  //   final displayText = dataGridRow
  //           .getCells()
  //           .firstWhere(
  //             (DataGridCell dataGridCell) =>
  //                 dataGridCell.columnName == column.columnName,
  //           )
  //           .value
  //           ?.toString() ??
  //       '';

  //   /// Returning the TextField with the numeric keyboard configuration.
  //   if (column.columnName == 'ARAÇ NO') {
  //     return Container(
  //       padding: const EdgeInsets.all(8),
  //       alignment: Alignment.centerRight,
  //       child: TextField(
  //         autofocus: true,
  //         controller: editingController..text = displayText,
  //         textAlign: TextAlign.right,
  //         decoration: const InputDecoration(
  //           contentPadding: EdgeInsets.zero,
  //           border: InputBorder.none,
  //           isDense: true,
  //         ),
  //         inputFormatters: [
  //           FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  //         ],
  //         keyboardType: TextInputType.number,
  //         onChanged: (String value) {
  //           if (value.isNotEmpty) {
  //             newCellValue = int.parse(value);
  //           } else {
  //             newCellValue = null;
  //           }
  //         },
  //         onSubmitted: (String value) {
  //           /// Call [CellSubmit] callback to fire the canSubmitCell and
  //           /// onCellSubmit to commit the new value in single place.
  //           submitCell();
  //         },
  //       ),
  //     );
  //   }
  //   return null;
  // }

  // @override
  // Future<void> onCellSubmit(
  //   DataGridRow dataGridRow,
  //   RowColumnIndex rowColumnIndex,
  //   GridColumn column,
  // ) async {
  //   final dynamic oldValue = dataGridRow
  //           .getCells()
  //           .firstWhereOrNull(
  //             (DataGridCell dataGridCell) =>
  //                 dataGridCell.columnName == column.columnName,
  //           )
  //           ?.value ??
  //       '';

  //   final dataRowIndex = rows.indexOf(dataGridRow);

  //   if (newCellValue == null || oldValue == newCellValue) {
  //     return;
  //   }

  //   if (column.columnName == 'ARAÇ NO') {
  //     rows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<int>(columnName: 'ARAÇ NO', value: newCellValue as int?);

  //     // Save the new cell value to model collection also.
  //     //_employeeData[dataRowIndex].id = newCellValue as int;
  //   }

  //   // To reset the new cell value after successfully updated to DataGridRow
  //   //and underlying mode.
  //   newCellValue = null;
  // }
}
