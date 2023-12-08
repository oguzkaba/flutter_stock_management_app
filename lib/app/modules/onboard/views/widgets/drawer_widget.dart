import 'package:flutter/material.dart';

import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';

/// The `class DrawerWidget extends StatelessWidget` is defining a custom widget called `DrawerWidget`
/// that extends the `StatelessWidget` class. This widget represents a drawer that can be used in a
/// Flutter application.
class DrawerWidget extends StatelessWidget {
  ///
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.myBlack,
      child: ListView.builder(
        itemCount: AppConstants.navLabelList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(AppConstants.navIconList[index]),
            title: Text(AppConstants.navLabelList[index]),
          );
        },
      ),
    );
  }
}
