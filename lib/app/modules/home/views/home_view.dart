import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../core/utils/datasource.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: HomeDatagridWidget(controller: controller),
    );
  }
}

class HomeDatagridWidget extends StatefulWidget {
  const HomeDatagridWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<HomeDatagridWidget> createState() => _HomeDatagridWidgetState();
}

class _HomeDatagridWidgetState extends State<HomeDatagridWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.controller.isLoading.value
        ? LinearProgressIndicator(
            backgroundColor: ColorConstants.secondaryColor,
            color: ColorConstants.skyBlue)
        : Card(
            margin: EdgeInsets.all(30),
            child: SfDataGrid(
                allowFiltering: true,
                allowSorting: true,
                isScrollbarAlwaysShown: true,
                //frozenColumnsCount: 1,
                allowColumnsResizing: true,
                onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                  widget.controller.columnWidths[details.column.columnName] =
                      details.width;
                  return true;
                },
                columnWidthMode: ColumnWidthMode.auto,
                source: GridDataSource(widget.controller),
                columns: widget.controller.dataColumn
                    .map((e) => GridColumn(
                        width: widget.controller.columnWidths[e]!,
                        columnName: e,
                        label: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(8.0),
                          child: Text(e,
                              style: Theme.of(context).textTheme.titleSmall,
                              overflow: TextOverflow.ellipsis),
                        )))
                    .toList()),
          ));
  }
}
