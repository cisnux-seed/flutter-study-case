import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// add note controller
class AddNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController body;

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    body = TextEditingController();
  }

  @override
  void onClose() {
    title.dispose();
    body.dispose();
    debugPrint('"Your kind AddController is already disposed"');
    super.onClose();
  }
}
