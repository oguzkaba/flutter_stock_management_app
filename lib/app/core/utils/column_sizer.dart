import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The `CustomColumnSizer` class is extending the `ColumnSizer` class in the
/// `syncfusion_flutter_datagrid` package. By extending the `ColumnSizer` class, the `CustomColumnSizer`
/// class can override the methods defined in the `ColumnSizer` class to customize the column sizing
/// behavior in a data grid.
class CustomColumnSizer extends ColumnSizer {
  @override
  double computeHeaderCellWidth(GridColumn column, TextStyle style) {
    const style = TextStyle(fontWeight: FontWeight.bold);

    return super.computeHeaderCellWidth(column, style);
  }

  @override
  double computeCellWidth(
    GridColumn column,
    DataGridRow row,
    Object? cellValue,
    TextStyle textStyle,
  ) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);

    return super.computeCellWidth(column, row, cellValue, textStyle);
  }
}
