// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/utils/datagrid.dart';
import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<SfDataGridState>();
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? LinearProgressIndicator(
                backgroundColor: ColorConstants.secondaryColor,
                color: ColorConstants.skyBlue,
              )
            : DataGridWidget(
                datagridKey: key,
                data: controller.allMaterialList,
                dataColumn: AppConstants.materilDataGridColumn,
              ),
      ),
    );
  }
}
