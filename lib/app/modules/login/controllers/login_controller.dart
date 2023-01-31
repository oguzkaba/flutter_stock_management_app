import 'package:get/get.dart';

class LoginController extends GetxController {
  final _visiblePass = true.obs;

  @override
  void onClose() {}
  bool get visiblePass => _visiblePass.value;
  void toggleVisible() => _visiblePass.value = !_visiblePass.value;
}
