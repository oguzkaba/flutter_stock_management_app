// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/core/models/supabase_models/report_model.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String calcReportNumber(List<ReportModel> reportList) {
    if (reportList.isEmpty) {
      return 'SR-0001';
    }
    return 'SR-${(int.parse(reportList.last.repNo.substring(3)) + 1).toString().padLeft(4, '0')}';
  }

  static String calcTruckNumber(List<ReportModel> reportList) {
    if (reportList.isEmpty) {
      return '0001';
    }
    return (int.parse(reportList.last.repNo.substring(3)) + 1)
        .toString()
        .padLeft(4, '0');
  }

  static String dateFormatDDMMYYYY(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String dateFormatYYYYMMDD(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String changeDateForDB(String dateString) {
    return dateString.split('-').reversed.join('-');
  }
}
