import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);
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
