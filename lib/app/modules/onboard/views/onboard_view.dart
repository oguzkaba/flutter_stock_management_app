import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors_constants.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/custom_iconbutton.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => NavigationRail(
            unselectedIconTheme:
                IconThemeData(color: ColorConstants.myMediumGrey, size: 20),
            unselectedLabelTextStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(
                    color: ColorConstants.myMediumGrey,
                    fontWeight: FontWeight.w500),
            groupAlignment: 0,
            labelType: NavigationRailLabelType.all,
            useIndicator: true,
            indicatorColor: ColorConstants.myBlack,
            backgroundColor: Get.isDarkMode
                ? Theme.of(context).navigationRailTheme.backgroundColor
                : ColorConstants.myLightGrey,
            leading: _buildLeading(context),
            destinations: [
              for (var i = 0; i < AppConstants.navLabelList.length; i++)
                NavigationRailDestination(
                    icon: Icon(AppConstants.navIconList[i]),
                    label: Text(
                      AppConstants.navLabelList[i],
                    )),
            ],
            selectedIndex: controller.pageIndex.value,
            onDestinationSelected: (value) => controller.setPageIndex(value),
            trailing: _buildTrailing(context))),
        Expanded(
            child: Obx(() => Scaffold(
                  appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      title: Row(
                        children: [
                          Text(AppConstants
                              .navLabelList[controller.pageIndex.value]),
                          Spacer(),
                          _buildSearchBox(),
                        ],
                      ),
                      actions: _buildAppBarActions(context)),
                )))
      ],
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) => [
        Badge(
            child:
                CustomIconButton(iconData: Icons.notifications, onTap: () {})),
        AppConstants.horizontalPaddingSmall,
        CustomIconButton(
            iconData: Get.isDarkMode
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded,
            onTap: () => ThemeController().changeThemeMode()),
        AppConstants.horizontalPaddingSmall,
        CircleAvatar(
          backgroundColor: ColorConstants.myBlack,
          radius: 19,
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        AppConstants.horizontalPaddingSmall,
        Align(
            alignment: Alignment.center,
            child: Text('Oguz KABA',
                style: Theme.of(context).textTheme.labelMedium)),
        AppConstants.horizontalPaddingSmall,
      ];

  SizedBox _buildSearchBox() {
    return SizedBox(
      width: controller.serchBoxFocus.value ? Get.width - 450 : 200,
      child: CustomTextField(
          focusNode: controller.focus,
          onSubmitted: (value) => debugPrint('Search Enter Key'),
          fillColor: ColorConstants.myLightGrey,
          hintText: 'Search here...',
          prefixIconData: Icons.search),
    );
  }

  Column _buildLeading(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo.png', width: 32),
        Text('Stocker',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient)),
        SizedBox(height: 32),
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
                SizedBox(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(elevation: 0),
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      icon: Icon(Icons.exit_to_app_rounded,
                          size: 16, color: ColorConstants.myDarkRed),
                      label: Text('Exit',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 10))),
                ),
                SizedBox(height: 8),
                Text('v.1.0.0', style: Theme.of(context).textTheme.labelSmall),
              ],
            )),
      ),
    );
  }
}
