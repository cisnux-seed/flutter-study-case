import 'package:get/get.dart';
import 'package:note_app/modules/controllers/database_controller.dart';

/// injected controller database to root widget tree
class DatabaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DatabaseController());
  }
}
