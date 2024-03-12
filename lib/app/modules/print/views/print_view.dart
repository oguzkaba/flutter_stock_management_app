// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/print/controllers/print_controller.dart';
import 'package:get/get.dart';

class PrintView extends GetView<PrintController> {
  const PrintView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrintView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrintView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
