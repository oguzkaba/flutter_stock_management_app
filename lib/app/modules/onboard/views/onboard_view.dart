import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/app_constants.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/controllers/theme_controller.dart';
import 'package:flutter_stock_management_app/app/core/utils/responsive.dart';
import 'package:flutter_stock_management_app/app/modules/add_material/views/add_material_view.dart';
import 'package:flutter_stock_management_app/app/modules/home/views/home_view.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/views/widgets/drawer_widget.dart';
import 'package:flutter_stock_management_app/app/modules/onboard/views/widgets/navrail_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_icon_button_widget.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_textfield_widget.dart';
import 'package:get/get.dart';

/// The `class OnboardView extends GetView<OnboardController>` is defining a Flutter widget called
/// `OnboardView` that extends the `GetView` class from the GetX package. This means that `OnboardView`
/// is a GetX view widget, which allows for easy integration of state management and dependency
/// injection using the GetX library.
class OnboardView extends GetView<OnboardController> {
  ///
  const OnboardView({super.key});

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
                drawer: !Responsive.isDesktop(context)
                    ? const DrawerWidget()
                    : null,
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Row(
                    children: [
                      Text(
                        AppConstants.navLabelList[controller.pageIndex],
                      ),
                      const Spacer(),
                      _buildSearchBox(),
                    ],
                  ),
                  actions: _buildAppBarActions(context),
                ),
                body: IndexedStack(
                  index: controller.pageIndex,
                  children: const [HomeView(), AddMaterialView()],
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
          onTap: () => ThemeController().changeThemeMode(),
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

  SizedBox _buildSearchBox() {
    return SizedBox(
      width: controller.serchBoxFocus.value ? Get.width - 450 : 200,
      child: CustomTextField(
        focusNode: controller.focus,
        onSubmitted: (value) => debugPrint('Search Enter Key'),
        fillColor: ColorConstants.myLightGrey,
        hintText: 'Search here...',
        prefixIconData: Icons.search,
      ),
    );
  }
}
