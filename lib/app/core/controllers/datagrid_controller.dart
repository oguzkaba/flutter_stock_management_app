// ignore_for_file: public_member_api_docs

import 'package:flutter/services.dart';
import 'package:flutter_stock_management_app/app/core/models/dummy_data_model.dart';
import 'package:get/get.dart';

class DGController extends GetxController {
  final dummyData = <DummyDataModel>[].obs;
  List<String> dataColumn = <String>[];
  final Map<String, dynamic> columnWidths = <String, dynamic>{}.obs;
  // ignore: prefer_const_constructors
  final popupPos = Offset(0, 0).obs;
  final isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await _init();
    super.onInit();
  }

  Future<void> _init() async {
    final jsonString = await getJson();
    dummyData.value = dummyDataModelFromJson(jsonString);
    dataColumn = [
      'SIRA NO',
      'ARAÇ NO',
      'MALZEMENİN CİNSİ',
      'ÜRÜN TANIMI',
      'RAF NO',
      'DN',
      'ITEM NO',
      'HEAT NO',
      'ADET',
      'GELEN ADET',
      'İADE ADET',
      'KALAN ADET',
      'KALİTE',
      'GELİŞ TARİHİ',
      'GELEN FİRMA',
      'SHIPMENT NUMBER',
      'SANDIK NO',
      'NOT',
    ];
    for (final e in dataColumn) {
      columnWidths[e] = double.nan;
    }
    isLoading.value = false;
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/jsons/dummy_data.json');
  }
}
