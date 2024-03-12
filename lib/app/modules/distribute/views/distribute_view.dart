// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/distribute_controller.dart';

class DistributeView extends GetView<DistributeController> {
  const DistributeView({super.key});
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
