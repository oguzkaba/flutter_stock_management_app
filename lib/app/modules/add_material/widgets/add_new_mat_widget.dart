import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_material_controller.dart';

/// Add Material View
class AddNewMaterialWidget extends GetView<AddMaterialController> {
  ///
  const AddNewMaterialWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Card(
                  child: SizedBox(
                    width: Get.width,
                    child: const Wrap(),
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Card(
                  child: SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
