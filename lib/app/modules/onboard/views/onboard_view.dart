import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors_constants.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
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
            backgroundColor: ColorConstants.myLightGrey,
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
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications,
                size: 20, color: ColorConstants.myMediumGrey)),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings,
                size: 20, color: ColorConstants.myMediumGrey)),
        AppConstants.horizontalPaddingSmall,
        CircleAvatar(
          radius: 22,
          child: CircleAvatar(
            radius: 20,
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
      child: TextField(
          focusNode: controller.focus,
          onSubmitted: (value) => debugPrint('Search Enter Key'),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded,
                  color: ColorConstants.myMediumGrey),
              hintText: 'Search here...',
              hintStyle: TextStyle(
                fontSize: 12,
              ),
              contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 0),
              filled: true,
              fillColor: ColorConstants.myLightGrey,
              border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
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
            child:
                Text('v.1.0.0', style: Theme.of(context).textTheme.labelSmall)),
      ),
    );
  }
}
