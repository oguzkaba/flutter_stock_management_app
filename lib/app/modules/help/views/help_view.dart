// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/modules/help/controllers/help_controller.dart';
import 'package:get/get.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HelpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
