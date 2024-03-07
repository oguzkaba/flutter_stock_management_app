import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/core/services/supabase_service.dart';
import 'package:flutter_stock_management_app/app/modules/widgets/custom_dialog_widget.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// The code is defining a class called `ExitButton` that
/// extends the `StatelessWidget` class. The
/// `ExitButton` class has a constructor that takes a
/// named parameter `key` and passes it to the `super`
/// constructor.
final class CustomExitButton extends StatelessWidget {
  ///
  const CustomExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      style: FilledButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorConstants.myDarkRed,
      ),
      onPressed: () {
        CustomDialogWidget.show(
          dialogName: 'exit_dialog'.tr,
          title: 'exit'.tr,
          child: Text('are_you_sure_you_want_to_exit'.tr),
          onOk: () {
            SupabaseService.instance.signOut();
            Get.offAllNamed<dynamic>(Routes.LOGIN);
          },
          onCancel: Get.back<dynamic>,
        );
      },
      icon: Icon(
        Icons.exit_to_app_rounded,
        size: 16,
        color: ColorConstants.myLightRed,
      ),
      label: Text(
        'exit'.tr,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 10, color: ColorConstants.myLightRed),
      ),
    );
  }
}
