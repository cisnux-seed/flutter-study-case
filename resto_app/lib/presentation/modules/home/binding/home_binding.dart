import 'package:get/get.dart';
import 'package:resto_app/presentation/modules/home/controllers/home_controller.dart';
import 'package:resto_app/presentation/modules/home/controllers/user_profile_controller.dart';

/// inject all controllers depedency to HomeView
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserProfileController());
    Get.put(HomeController());
  }
}
