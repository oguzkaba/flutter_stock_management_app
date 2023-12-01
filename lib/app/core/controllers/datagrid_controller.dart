import 'package:flutter/services.dart';
import '../models/dummy_data_model.dart';
import 'package:get/get.dart';

class DGController extends GetxController {
  final dummyData = <DummyDataModel>[].obs;
  List<String> dataColumn = <String>[];
  final Map columnWidths = <String, dynamic>{}.obs;
  final popupPos = Offset(0, 0).obs;
  final isLoading = true.obs;

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }

  Future<void> _init() async {
    var jsonString = await getJson();
    dummyData.value = dummyDataModelFromJson(jsonString);
    dataColumn = [
      "SIRA NO",
      "ARAÇ NO",
      "MALZEMENİN CİNSİ",
      "ÜRÜN TANIMI",
      "RAF NO",
      "DN",
      "ITEM NO",
      "HEAT NO",
      "ADET",
      "GELEN ADET",
      "İADE ADET",
      "KALAN ADET",
      "KALİTE",
      "GELİŞ TARİHİ",
      "GELEN FİRMA",
      "SHIPMENT NUMBER",
      "SANDIK NO",
      "NOT",
    ];
    for (var e in dataColumn) {
      columnWidths[e] = double.nan;
    }
    isLoading.value = false;
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/jsons/dummy_data.json');
  }
}
