// ignore_for_file: public_member_api_docs

import 'package:flutter_stock_management_app/app/modules/add_material/controllers/add_material_controller.dart';
import 'package:get/get.dart';

class AddMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMaterialController>(
      AddMaterialController.new,
    );
  }
}
