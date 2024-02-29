// ignore_for_file: public_member_api_docs

import 'package:get/get_utils/src/get_utils/get_utils.dart';

mixin class ValidatorMixin {
  (String?, bool) validateEmailTextField(String? value) {
    if (value == null || value.isEmpty) {
      return ('Email is required', true);
    }
    if (!GetUtils.isEmail(value)) {
      return ('Invalid email', true);
    }
    return (null, false);
  }

  (String?, bool) validatePasswordTextField(String? value) {
    if (value == null || value.isEmpty) {
      return ('Password is required', true);
    }
    if (value.length < 6) {
      return ('Password must be at least 6 characters long', true);
    }
    return (null, false);
  }
}
