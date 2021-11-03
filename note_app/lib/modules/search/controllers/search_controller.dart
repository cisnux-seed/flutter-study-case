import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// controller for search view
class SearchNoteController extends GetxController {
  late TextEditingController search;

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
  }

  @override
  void onClose() {
    search.dispose();
    debugPrint('"Your kind SearchController is already disposed"');
    super.onClose();
  }
}
