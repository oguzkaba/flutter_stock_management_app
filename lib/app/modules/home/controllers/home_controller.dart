// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:flutter_stock_management_app/app/core/models/supabase_models/material_model.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';

/// The code is defining a class called `HomeController` that extends the `GetxController` class. This
/// means that `HomeController` inherits all the properties and methods of the `GetxController` class
/// and can also define its own properties and methods.
class HomeController extends GetxController {
  final _supabaseService = SupabaseService.instance;
  final _allMaterialList = <MaterialsModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    materialsTableReaTime();
    super.onInit();
  }

  /// Getters
  List<MaterialsModel> get allMaterialList => _allMaterialList;

  /// This function is likely intended to display a real-time materials table.
  void materialsTableReaTime() {
    _supabaseService.subscribeToData(table: 'material').listen(
      (List<Map<String, dynamic>> data) {
        final convertData = materialsModelFromJson(data);
        if (!listEquals(_allMaterialList, convertData)) {
          isLoading.value = true;
          _allMaterialList
            ..clear()
            ..value = convertData;
          isLoading.value = false;
          CustomSnackbarWidget.show(
            'Info',
            'Refreshing the "material" list...',
          );
        }
      },
      onDone: () {
        CustomSnackbarWidget.show(
          'Done',
          'Closing the "material" list...',
        );
      },
      onError: (dynamic error) {
        CustomSnackbarWidget.show(
          'Error',
          '$error, while refreshing the report list...',
        );
      },
    );
  }
}
