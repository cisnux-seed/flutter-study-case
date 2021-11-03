import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/models/model_notes.dart';

/// controller for note profile view
class ProfileNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController body;
  final isFirstCall = Rx<bool>(true);
  final isReadOnly = Rx<bool>(true);

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
    debugPrint('"Your kind ProfileController is already disposed"');
    super.onClose();
  }

  /// method for check auto focus is enable
  void enableAutoFocus() {
    isReadOnly.value = !isReadOnly.value;
    debugPrint(isReadOnly.value.toString());
  }

  /// method for set note profile, on the first time called
  void setProfileNote(Note note) {
    if (isFirstCall.value) {
      debugPrint('"Initialized TextEditingController title and body"');
      title.text = note.title;
      body.text = note.body;
      title.selection = TextSelection.fromPosition(
        TextPosition(
          offset: title.text.length,
        ),
      );
      body.selection = TextSelection.fromPosition(
        TextPosition(
          offset: body.text.length,
        ),
      );
      isFirstCall.value = false;
    }
  }
}
