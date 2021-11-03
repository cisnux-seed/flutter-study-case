import 'package:get/get.dart';
import 'package:note_app/modules/profile/controllers/profile_controller.dart';

/// injected to note profile view
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileNoteController());
  }
}
