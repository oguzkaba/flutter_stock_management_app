import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';
import 'package:flutter_stock_management_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// The code is defining a class called `ExitButton` that
/// extends the `StatelessWidget` class. The
/// `ExitButton` class has a constructor that takes a
/// named parameter `key` and passes it to the `super`
/// constructor.
final class ExitButton extends StatelessWidget {
  ///
  const ExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      style: FilledButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorConstants.myDarkRed,
      ),
      onPressed: () => Get.offAllNamed<dynamic>(Routes.LOGIN),
      icon: Icon(
        Icons.exit_to_app_rounded,
        size: 16,
        color: ColorConstants.myLightRed,
      ),
      label: Text(
        'Exit',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 10, color: ColorConstants.myLightRed),
      ),
    );
  }
}
