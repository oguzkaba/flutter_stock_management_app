import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CustomColumnSizer extends ColumnSizer {
  @override
  double computeHeaderCellWidth(GridColumn column, TextStyle style) {
    style = const TextStyle(fontWeight: FontWeight.bold);

    return super.computeHeaderCellWidth(column, style);
  }

  @override
  double computeCellWidth(GridColumn column, DataGridRow row, Object? cellValue,
      TextStyle textStyle) {
    textStyle = const TextStyle(fontWeight: FontWeight.bold);

    return super.computeCellWidth(column, row, cellValue, textStyle);
  }
}
