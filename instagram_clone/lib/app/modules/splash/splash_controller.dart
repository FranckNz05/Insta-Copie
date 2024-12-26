import 'package:get/get.dart';
import '../auth/auth_controller.dart';

class SplashController extends GetxController {
  final AuthController authController;
  final isLoading = true.obs;
  
  SplashController(this.authController);
  
  @override
  void onInit() {
    super.onInit();
    ever(authController.isLoggedIn, _handleAuthChanged);
    _initializeApp();
  }
  
  void _handleAuthChanged(bool isLoggedIn) {
    if (!isLoading.value) {
      Get.offAllNamed(isLoggedIn ? '/home' : '/auth');
    }
  }
  
  Future<void> _initializeApp() async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2)); // Afficher le splash pendant 2 secondes
      await authController.checkAuthStatus();
    } finally {
      isLoading.value = false;
      Get.offAllNamed(
        authController.isLoggedIn.value ? '/home' : '/auth'
      );
    }
  }
  
  @override
  void onClose() {
    // Ne pas appeler dispose() sur _authController car il est géré par GetX
    super.onClose();
  }
}
