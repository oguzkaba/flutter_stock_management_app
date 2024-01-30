// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stock_management_app/app/core/models/material_type_model.dart';
import 'package:get/get.dart';

class AddMaterialController extends GetxController {
  /// Variables
  final _materialTypeList = <MaterialTypeModel>[].obs;
  final _isMaterialTypeLoading = true.obs;
  final _isEnabledMap = <String, bool>{
    '1': true,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
  }.obs;
  final _errorText = Rxn<String>();
  final _selectTruck = Rxn<int>();
  final textController = TextEditingController().obs;
  final selectDate = Rxn<String>();

  /// Getters
  List<MaterialTypeModel> get materialTypeList => _materialTypeList;
  bool get isMaterialTypeLoading => _isMaterialTypeLoading.value;
  Map<String, bool> get isEnabledMap => _isEnabledMap;
  Rxn<String> get errorText => _errorText;
  Rxn<int> get selectTruck => _selectTruck;

  ///Init method
  @override
  Future<void> onInit() async {
    _isMaterialTypeLoading.value = true;
    final jsonString = await getMaterialTypeJson();
    _materialTypeList.value = materialTypeModelFromJson(jsonString);
    _isMaterialTypeLoading.value = false;
    super.onInit();
  }

  Future<String> getMaterialTypeJson() async =>
      rootBundle.loadString('assets/jsons/material-type.json');

  void enableDropDown(List<String> idList) {
    _errorText.value = null;
    for (var i = 0; i < idList.length; i++) {
      _isEnabledMap[idList[i]] = true;
    }
  }

  void disableDropDown(String id) {
    if (id == '1' || (isEnabledMap[id] ?? false)) {
      _errorText.value = 'Please select a value';
    } else {
      _errorText.value = null;
    }
    _isEnabledMap[id] = false;
  }
}
