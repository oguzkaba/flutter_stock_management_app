import 'package:get/get.dart';

class OnboardController extends GetxController {
  final pageIndex = 0.obs;

  @override
  void onInit() {
    pageIndex.value = 0;
    super.onInit();
  }

  void setPageIndex(int index) => pageIndex.value = index;
}
