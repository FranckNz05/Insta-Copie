import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/mock_data.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  
  TextEditingController get usernameController => _usernameController!;
  TextEditingController get passwordController => _passwordController!;
  
  @override
  void onInit() {
    super.onInit();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    checkAuthStatus();
  }
  
  @override
  void onClose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    _usernameController = null;
    _passwordController = null;
    super.onClose();
  }
  
  Future<void> checkAuthStatus() async {
    try {
      // Simuler une vérification d'authentification
      await Future.delayed(Duration(seconds: 1));
      isLoggedIn.value = false;
    } catch (e) {
      print('Erreur lors de la vérification du statut d\'authentification: $e');
      isLoggedIn.value = false;
    }
  }
  
  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Erreur',
        'Veuillez remplir tous les champs',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 1)); // Simuler un délai réseau
      
      // Vérifier les identifiants (mock)
      if (usernameController.text == MockData.currentUser['username'] &&
          passwordController.text == '123456') {
        isLoggedIn.value = true;
        Get.offAllNamed('/home');
      } else {
        Get.snackbar(
          'Erreur',
          'Identifiants incorrects',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Erreur lors de la connexion: $e');
      Get.snackbar(
        'Erreur',
        'Une erreur est survenue',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/auth');
  }
}
