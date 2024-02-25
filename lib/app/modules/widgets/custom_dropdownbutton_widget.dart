// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/constants/colors_constants.dart';

class CustomDropdownButtonWidget extends StatelessWidget {
  const CustomDropdownButtonWidget({
    required this.items,
    required this.onSelect,
    this.enabled,
    this.value,
    super.key,
  });
  final int? value;
  final List<bool>? enabled;
  final List<String> items;
  final ValueChanged<int?>? onSelect;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        focusColor: Colors.transparent,
        items: items
            .map(
              (e) => DropdownMenuItem(
                enabled: _getIsEnabled(e),
                value: items.indexOf(e),
                child: _getIsEnabled(e)
                    ? Text(e)
                    : Text(
                        '$e (Passive)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: _getIsEnabled(e)
                                  ? null
                                  : ColorConstants.myLightRed,
                            ),
                      ),
              ),
            )
            .toList(),
        onChanged: onSelect,
        value: value,
        style: Theme.of(context).textTheme.bodySmall,
        hint: const Text('Select...'),
      ),
    );
  }

  bool _getIsEnabled(String e) {
    if (enabled != null) {
      if (enabled!.isNotEmpty) {
        return enabled![items.indexOf(e)];
      }
    }
    return true;
  }
}
