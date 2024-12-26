import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                // Logo Instagram (en texte)
                Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                
                // Champ de texte pour le nom d'utilisateur
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: controller.usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Nom d\'utilisateur',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                // Champ de texte pour le mot de passe
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                
                // Bouton de connexion
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value 
                      ? null 
                      : () => controller.login(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: controller.isLoading.value
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Se connecter',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                )),
                SizedBox(height: 16),
                
                // Lien "Mot de passe oublié ?"
                TextButton(
                  onPressed: () {
                    // TODO: Implémenter la récupération de mot de passe
                  },
                  child: Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
