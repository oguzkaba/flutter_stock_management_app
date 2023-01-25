import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text(
                  controller.count.value.toString(),
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 200,
            ),
            MaterialButton(onPressed: () => controller.increment())
          ],
        ),
      ),
    );
  }
}
