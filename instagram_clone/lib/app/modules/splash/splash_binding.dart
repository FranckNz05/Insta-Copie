import 'package:get/get.dart';
import '../auth/auth_controller.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // S'assurer que AuthController est initialisé en premier
    Get.put(AuthController());
    
    // Injecter le AuthController dans le SplashController
    Get.put(SplashController(Get.find<AuthController>()));
  }
}
