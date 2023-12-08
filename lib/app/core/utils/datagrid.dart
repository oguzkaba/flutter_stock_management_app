import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/controllers/datagrid_controller.dart';
import 'package:flutter_stock_management_app/app/core/utils/datasource.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// The DataGridWidget class is a stateless widget in Dart.
class DataGridWidget extends StatelessWidget {
  /// The line `const DataGridWidget({super.key});` is defining a constructor
  /// for the `DataGridWidget` class.
  const DataGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DGController());
    final dataGridController = DataGridController();
    final overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;
    final popItems = <PopupMenuItem<Widget>>[
      const PopupMenuItem(
        child: Text('See Material'),
      ),
      const PopupMenuItem(
        child: Text('Delete Material'),
      )
    ];
    return Obx(
      () => controller.isLoading.value
          ? LinearProgressIndicator(
              backgroundColor: ColorConstants.secondaryColor,
              color: ColorConstants.skyBlue,
            )
          : SfDataGridTheme(
              data: SfDataGridThemeData(
                brightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
                sortIconColor: ColorConstants.secondaryColor,
              ),
              child: SfDataGrid(
                onSelectionChanged: (a, r) => debugPrint(
                  dataGridController.selectedRows.length.toString(),
                ),
                //showCheckboxColumn: true,
                selectionMode: SelectionMode.multiple,
                controller: dataGridController,
                onCellLongPress: (details) => _showPopupMenu(
                  context,
                  details.globalPosition,
                  overlay,
                  popItems,
                ),
                onCellTap: (details) {},

                //allowEditing: true,
                allowFiltering: true,
                allowSorting: true,
                isScrollbarAlwaysShown: true,
                //frozenColumnsCount: 1,
                // allowColumnsResizing: true,
                // onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                //   controller.columnWidths[details.column.columnName] =
                //       details.width;
                //   return true;
                // },
                columnWidthMode: ColumnWidthMode.auto,
                source: GridDataSource(controller),
                columns: controller.dataColumn
                    .map(
                      (e) => GridColumn(
                        width: double.parse(
                          controller.columnWidths[e].toString(),
                        ),
                        columnName: e,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8),
                          child: Text(e, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }

  Future<dynamic> _showPopupMenu(
    BuildContext context,
    Offset globalPosition,
    RenderBox? overlay,
    List<PopupMenuItem<dynamic>> popItems,
  ) {
    return showMenu(
      context: context,
      position: RelativeRect.fromRect(
        globalPosition & const Size(150, 150),
        Offset.zero &
            (overlay == null ? Size(Get.width, Get.height * .8) : overlay.size),
      ),
      items: popItems,
    );
  }
}
