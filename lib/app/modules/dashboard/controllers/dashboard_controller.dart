// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/models/supabase_models/project_model.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _addMaterialController = Get.put(AddMaterialController());
  final _pageIndex = 0.obs;
  final selectedPrjIndex = 0.obs;
  final _projectList = <ProjectModel>[].obs;
  final _selectedProject = Rxn<ProjectModel>();

  /// Getters and Setters
  int get pageIndex => _pageIndex.value;
  set pageIndex(int value) => _pageIndex.value = value;
  RxList<ProjectModel> get projectList => _projectList;
  Rxn<ProjectModel> get selectedProject => _selectedProject;

  ///
  final focus = FocusNode();

  ///
  final serchBoxFocus = false.obs;

  @override
  Future<void> onInit() async {
    await getDBList('project');
    focus.addListener(onFocusChange);
    super.onInit();
  }

  Future<void> getDBList(String table) async {
    await SupabaseService.instance.fetchData(table: table).then((value) {
      projectList.value = projectModelFromJson(value);
      _addMaterialController.reportTableRealTime(projectList[0].id!);
      _selectedProject.value = projectList[0];
    });
  }

  void selectProject(int index) {
    if (selectedPrjIndex.value != index) {
      selectedPrjIndex.value = index;
      selectedProject.value = projectList[index];
      _addMaterialController
        ..closeReportList()
        ..reportTableRealTime(projectList[index].id!);
    }
  }

  @override
  void onClose() {
    // focus
    //   ..removeListener(onFocusChange)
    //   ..dispose();
    super.onClose();
  }

  ///
  void onFocusChange() => serchBoxFocus.value = focus.hasFocus;
}
