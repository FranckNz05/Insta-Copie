import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() => controller.isLoading.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Instagram',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Billabong',
                  ),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            )
          : SizedBox.shrink()
        ),
      ),
    );
  }
}
