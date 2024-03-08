import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/distribute_controller.dart';

class DistributeView extends GetView<DistributeController> {
  const DistributeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DistributeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DistributeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
