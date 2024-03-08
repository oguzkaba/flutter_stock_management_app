import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/print_controller.dart';

class PrintView extends GetView<PrintController> {
  const PrintView({Key? key}) : super(key: key);
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
