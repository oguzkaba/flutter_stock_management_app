import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../constants/colors_constants.dart';
import '../controllers/datagrid_controller.dart';
import 'datasource.dart';

class DataGridWidget extends StatelessWidget {
  const DataGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DatagridController controller = Get.put(DatagridController());
    return Obx(() => controller.isLoading.value
        ? LinearProgressIndicator(
            backgroundColor: ColorConstants.secondaryColor,
            color: ColorConstants.skyBlue)
        : SfDataGridTheme(
            data: SfDataGridThemeData(
                headerColor: Get.isDarkMode
                    ? ColorConstants.myMediumGrey
                    : ColorConstants.myLightGrey),
            child: SfDataGrid(
                allowEditing: true,
                //allowFiltering: true,
                allowSorting: true,
                isScrollbarAlwaysShown: true,
                //frozenColumnsCount: 1,
                allowColumnsResizing: true,
                onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                  controller.columnWidths[details.column.columnName] =
                      details.width;
                  return true;
                },
                columnWidthMode: ColumnWidthMode.auto,
                source: GridDataSource(controller),
                columns: controller.dummyData
                    .map((e) => GridColumn(
                        width: controller.columnWidths[e]!,
                        columnName: e,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(8.0),
                          child: Text(e, overflow: TextOverflow.ellipsis),
                        )))
                    .toList()),
          ));
  }
}
