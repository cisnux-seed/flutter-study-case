import 'package:get/get.dart';
import '../controller/splash_controller.dart';

/// depedency injection of SplashView
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
