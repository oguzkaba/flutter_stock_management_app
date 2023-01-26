import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors_constants.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return Row(
      children: [
        Expanded(
            child: Drawer(
          backgroundColor: ColorConstants.myLightGrey,
          child: Column(
            children: [
              SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 32),
                  SizedBox(width: 8),
                  Text('Stock Management',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 40),
              ListView.builder(
                itemCount: AppConstants.navLabelList.length,
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          hoverColor: ColorConstants.myWhite,
                          leading: Icon(
                            AppConstants.navIconList[index],
                          ),
                          title: Text(AppConstants.navLabelList[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: index == controller.pageIndex.value
                                        ? ColorConstants.secondaryColor
                                        : ColorConstants.myMediumGrey,
                                  )),
                          onTap: () {
                            controller.pageIndex.value = index;
                            debugPrint('index ');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          selectedTileColor: index == controller.pageIndex.value
                              ? ColorConstants.myWhite
                              : ColorConstants.myMediumGrey,
                          selected: index == controller.pageIndex.value
                              ? true
                              : false,
                        ),
                      ));
                },
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          ),
        )),
        VerticalDivider(thickness: 1, width: 1),
        Expanded(flex: 5, child: HomeView())
      ],
    );
  }
}
