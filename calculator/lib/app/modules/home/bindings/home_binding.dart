import 'package:get/get.dart';
import '../controllers/expression_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpressionController>(
      () => ExpressionController(),
    );
  }
}
