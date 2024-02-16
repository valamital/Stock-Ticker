import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utiles/image_constant.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  /// Using GetX to manage state and dependency injection
  final SplashController controller = Get.find<SplashController>();

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          /// Using the imported image constant
          ImageConstant.stockImg,

          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
