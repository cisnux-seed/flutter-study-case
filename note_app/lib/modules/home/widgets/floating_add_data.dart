import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/app_routes.dart';

/// floating button for navigate to add view
Widget floatingAddData() {
  return Padding(
    padding: EdgeInsets.only(
      right: Get.mediaQuery.padding.right + 15.0,
      bottom: Get.mediaQuery.padding.bottom + 15.0,
    ),
    child: SizedBox(
      height: Get.height * 0.09,
      width: Get.width * 0.18,
      child: FloatingActionButton(
        backgroundColor: Get.theme.buttonColor,
        child: Icon(
          Icons.add,
          size: 36.0,
        ),
        onPressed: () => Get.toNamed(RouteName.addView),
      ),
    ),
  );
}
