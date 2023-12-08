import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/utils/datagrid.dart';
import 'package:flutter_stock_management_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

/// The `class HomeView extends GetView<HomeController>` is creating a new class called `HomeView` that
/// extends the `GetView` class. The `GetView` class is a part of the GetX package, which is a state
/// management library for Flutter.
class HomeView extends GetView<HomeController> {
  /// The `const HomeView` is creating a constant constructor for the `HomeView` class. This means that
  /// the `HomeView` object created using this constructor will be immutable and its properties cannot
  /// be changed once it is created.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DataGridWidget(),
    );
  }
}
