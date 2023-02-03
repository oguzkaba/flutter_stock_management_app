import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DatagridController extends GetxController {
  final dummyData = [].obs;
  final List<String> dataColumn = <String>[].obs;
  final columnWidths = <String, dynamic>{}.obs;
  final isLoading = true.obs;

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }

  Future<void> _init() async {
    dummyData.value = json.decode(await getJson());
    isLoading.value = false;
  }

  Future<String> getJson() {
    return rootBundle.loadString('jsons/dummy_data.json');
  }
}
