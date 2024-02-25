// ignore_for_file: public_member_api_docs

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_stock_management_app/app/core/models/import_excel_data_model.dart';

/// This is the main project class.
class ExcelToJson {
  ExcelToJson._();

  /// Use this method to convert the file to a json.

  static Future<List<ImportDataModel>?> convertToJSON() async {
    final excel = await _getFile();

    if (excel == null) return null;

    final tables = _getTables(excel);
    final temp = <String, dynamic>{};

    for (final table in tables) {
      final keys = excel.tables[table]?.rows.first;
      final rows = excel.tables[table]?.rows;

      if (keys != null && rows != null) {
        final tempRows = <Map<String, dynamic>>[];

        for (var i = 1; i < rows.length; i++) {
          final row = rows[i];
          final tempRow = _getRows(keys, row);
          tempRows.add(tempRow);
        }

        temp[table] = tempRows;
      }

      final model = importDataModelFromJson(temp[table] as List<dynamic>);
      return model;
    }
    return null;
  }

  static Map<String, dynamic> _getRows(List<Data?> keys, List<Data?> row) {
    final temp = <String, dynamic>{};

    for (var i = 0; i < keys.length; i++) {
      temp[keys[i]?.value.toString() ?? ''] = row[i]?.value;
    }

    return temp;
  }

  static List<String> _getTables(Excel excel) {
    final keys = <String>[];

    for (final table in excel.tables.keys) {
      keys.add(table);
    }

    return keys;
  }

  static Future<Excel?> _getFile() async {
    final file = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    if (file != null && file.files.isNotEmpty) {
      final bytes = file.files.first.bytes!;

      return Excel.decodeBytes(bytes);
    } else {
      return null;
    }
  }
}
