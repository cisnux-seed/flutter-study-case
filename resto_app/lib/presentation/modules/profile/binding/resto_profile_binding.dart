import 'package:get/get.dart';
import 'package:resto_app/presentation/modules/profile/controller/resto_profile_controller.dart';

/// depedency injection of RestoProfileView
class RestoProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestoProfileContoller());
  }
}
