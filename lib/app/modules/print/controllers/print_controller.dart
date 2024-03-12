// ignore_for_file: public_member_api_docs

import 'package:get/get.dart';

class PrintController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
