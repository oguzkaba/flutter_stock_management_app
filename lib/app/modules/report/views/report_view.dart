// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
