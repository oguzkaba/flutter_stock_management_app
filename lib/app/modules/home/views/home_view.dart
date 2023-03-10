import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/datagrid.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataGridWidget(),
    );
  }
}
