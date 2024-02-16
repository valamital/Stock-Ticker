import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    /// Lazily injects an instance of SplashController when needed.
    Get.lazyPut(() => SplashController());
  }
}
