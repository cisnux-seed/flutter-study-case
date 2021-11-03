import 'package:get/get.dart';
import 'package:note_app/modules/add/controllers/add_controller.dart';

/// injected add controller to add view
class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddNoteController());
  }
}
