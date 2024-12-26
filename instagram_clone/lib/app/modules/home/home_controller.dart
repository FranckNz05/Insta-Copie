import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize any data or listeners here
  }

  @override
  void onClose() {
    // Dispose of any controllers or listeners here
    super.onClose();
  }
}
