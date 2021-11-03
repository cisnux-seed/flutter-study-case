import 'package:get/get.dart';
import 'package:note_app/modules/search/controllers/search_controller.dart';

// injected to search view
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNoteController());
  }
}
