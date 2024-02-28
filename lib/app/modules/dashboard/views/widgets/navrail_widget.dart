import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_exit_button_widget.dart';
import 'package:get/get.dart';

/// The code is defining a class called `NavigationRailWidget` that extends the `StatelessWidget` class.
/// This class represents a widget that displays a navigation rail, which is a vertical list of
/// destinations that the user can select to navigate between different sections of an app.
final class NavigationRailWidget extends StatelessWidget {
  ///
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Obx(
      () => NavigationRail(
        groupAlignment: -1,
        selectedIconTheme: IconThemeData(color: ColorConstants.myWhite),
        unselectedIconTheme:
            IconThemeData(color: ColorConstants.myMediumGrey, size: 20),
        selectedLabelTextStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.w500),
        labelType: NavigationRailLabelType.selected,
        useIndicator: true,
        indicatorColor: ColorConstants.myBlack,
        backgroundColor: Get.isDarkMode
            ? Theme.of(context).navigationRailTheme.backgroundColor
            : ColorConstants.myLightGrey,
        leading: _buildLeading(context),
        destinations: <NavigationRailDestination>[
          for (var i = 0; i < AppConstants.navLabelList.length; i++)
            NavigationRailDestination(
              icon: Icon(
                AppConstants.navIconList[i],
              ),
              label: Text(
                AppConstants.navLabelList[i],
              ),
            ),
        ],
        selectedIndex: controller.pageIndex,
        onDestinationSelected: (value) => controller.pageIndex = value,
        trailing: _buildTrailing(context),
      ),
    );
  }

  Column _buildLeading(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/logo.png', width: 32),
        Text(
          'Stocker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Expanded _buildTrailing(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomExitButton(),
              const SizedBox(height: 8),
              Text('v.1.0.0', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}
