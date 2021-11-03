import 'package:get/get.dart';
import 'package:resto_app/presentation/modules/search/controller/search_controller.dart';

/// depedency injection of SearchView
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
