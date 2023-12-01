// import 'package:excel/excel.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class DatagridController extends GetxController {
//   final List<String> dataColumn = <String>[].obs;
//   final dataRow = Rx<List<List<Data?>>>([]);
//   final columnWidths = <String, dynamic>{}.obs;
//   final isLoading = true.obs;

//   @override
//   void onInit() async {
//     await importFromExcel();
//     super.onInit();
//   }

//   importFromExcel() async {
//     await Future.delayed(Duration(seconds: 1));
//     isLoading.value = true;
//     dataRow.value.clear();
//     dataColumn.clear();
//     //await Future.delayed(Duration(seconds: 3));
//     ByteData data = await rootBundle.load("kitap.xlsx");
//     var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     var excel = Excel.decodeBytes(bytes);

//     for (var table in excel.tables.keys) {
//       //? Data Column
//       for (var val in excel.tables[table]!.row(0)) {
//         dataColumn.add(val!.value.toString());
//       }
//       //? Data Rows
//       for (var i = 1; i < excel.tables[table]!.rows.length; i++) {
//         dataRow.value.add(excel.tables[table]!.rows[i]);
//       }

//       for (var i = 0; i < dataColumn.length; i++) {
//         String columnName = dataColumn[i];
//         columnWidths[columnName] = double.nan;
//       }
//       isLoading.value = false;
//     }
//   }
// }
