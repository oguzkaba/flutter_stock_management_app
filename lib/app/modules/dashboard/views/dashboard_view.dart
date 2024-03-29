import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors_constants.dart';
import '../../../core/controllers/theme_controller.dart';
import '../../../core/utils/responsive.dart';
import '../../add_material/views/add_material_view.dart';
import '../../distribute/views/distribute_view.dart';
import '../../help/views/help_view.dart';
import '../../home/views/home_view.dart';
import '../../print/views/print_view.dart';
import '../../report/views/report_view.dart';
import '../../settings/views/settings_view.dart';
import '../../widgets/custom_dropdownbutton_widget.dart';
import '../../widgets/custom_icon_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../controllers/dashboard_controller.dart';
import 'widgets/drawer_widget.dart';
import 'widgets/navrail_widget.dart';

/// This Dart class represents a dashboard view that is associated with a specific controller.
class DashboardView extends GetView<DashboardController> {
  ///
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Responsive(
          mobile: SizedBox.shrink(),
          tablet: NavigationRailWidget(),
          desktop: NavigationRailWidget(),
        ),
        Expanded(
          child: Obx(
            () => SafeArea(
              child: Scaffold(
                drawer: !GetPlatform.isDesktop ? const DrawerWidget() : null,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  //TO-DO: Add a custom app bar
                  child: AnimatedCrossFade(
                    crossFadeState: controller.pageIndex == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300),
                    secondChild: const SizedBox(),
                    firstChild: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      title: Row(
                        children: [
                          Text(
                            AppConstants.navLabelList[controller.pageIndex],
                          ),
                          const Spacer(),
                          Container(
                            padding: AppConstants.edgeInsetsHorizontalSmall,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'project'.tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                AppConstants.horizontalPaddingSmall,
                                CustomDropdownButtonWidget(
                                  items: controller.projectList
                                      .map((e) => e.prjName)
                                      .toList(),
                                  enabled: controller.projectList
                                      .map((e) => e.isActive)
                                      .toList(),
                                  onSelect: (p0) =>
                                      controller.selectProject(p0 ?? 0),
                                  value: controller.selectedPrjIndex.value,
                                ),
                              ],
                            ),
                          ),
                          AppConstants.horizontalPaddingSmall,
                          _buildSearchBox(context),
                        ],
                      ),
                      actions: _buildAppBarActions(context),
                    ),
                  ),
                ),
                body: IndexedStack(
                  index: controller.pageIndex,
                  children: const [
                    HomeView(),
                    AddMaterialView(),
                    DistributeView(),
                    ReportView(),
                    PrintView(),
                    SettingsView(),
                    HelpView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) => [
        CustomIconButton(
          iconData: Icons.notifications,
          onTap: () {},
        ),
        AppConstants.horizontalPaddingSmall,
        CustomIconButton(
          iconData: Get.isDarkMode
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          onTap: () => Get.find<ThemeController>().changeThemeMode(),
        ),
        AppConstants.horizontalPaddingSmall,
        CircleAvatar(
          backgroundColor: ColorConstants.myBlack,
          radius: 19,
          child: const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        AppConstants.horizontalPaddingSmall,
        Align(
          child: Text(
            'Oguz KABA',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        AppConstants.horizontalPaddingSmall,
      ];

  Widget _buildSearchBox(BuildContext context) {
    return Responsive.isDesktop(context)
        ? SizedBox(
            width: controller.serchBoxFocus.value ? 400 : 200,
            child: CustomTextField(
              //focusNode: controller.focus,
              onChanged: (value) => debugPrint('Search Enter Key'),
              fillColor: ColorConstants.myLightGrey,
              hintText: 'search_here'.tr,
              prefixIconData: Icons.search,
            ),
          )
        : CustomIconButton(iconData: Icons.search_rounded, onTap: () {});
    //TO-DO: Add mobile search functionality
  }
}
