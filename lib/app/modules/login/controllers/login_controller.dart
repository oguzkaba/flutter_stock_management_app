import 'package:get/get.dart';

/// The `class LoginController` is extending the `GetxController` class. This means that
/// `LoginController` inherits all the properties and methods of the `GetxController` class.
class LoginController extends GetxController {
  final _visiblePass = true.obs;

  @override
  void onClose() {}

  /// The `bool get visiblePass` is a getter method that returns the value of the `_visiblePass`
  /// variable. It allows other parts of the code to access the value of `_visiblePass` without directly
  /// accessing the variable itself.
  bool get visiblePass => _visiblePass.value;

  /// The `void toggleVisible()` method is a function that toggles the value of the `_visiblePass`
  /// variable. It uses the `.value` property of the `RxBool` object `_visiblePass` to access and modify
  /// its value. When called, it will change the value of `_visiblePass` from `true` to `false` or from
  /// `false` to `true`.
  void toggleVisible() => _visiblePass.value = !_visiblePass.value;
}
