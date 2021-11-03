import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/modules/controllers/database_controller.dart';
import 'package:note_app/modules/widgets/note_custom_button.dart';
import 'package:note_app/routes/app_routes.dart';
import '../../widgets/generate_notes.dart';
import '../widgets/floating_add_data.dart';

/// home view
class HomeView extends StatelessWidget {
  /// get controller in property class not in method build
  /// to avoid inherited controller to other widget on widget tree
  final databaseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.080),
        child: Padding(
          padding: EdgeInsets.only(
            top: context.mediaQuery.padding.top - 10.0,
            left: context.mediaQuery.padding.left + 5.0,
            right: context.mediaQuery.padding.right + 20.0,
          ),
          child: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0.0,
            title: Text(
              'Notes',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 33.0,
              ),
            ),
            actions: [
              NoteCustomButton(
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
                color: context.theme.buttonColor,
                heightButton: context.height * 0.055,
                widthButton: context.width * 0.13,
                onTap: () => Get.toNamed(RouteName.searchView),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => Get.find<DatabaseController>().notes.isEmpty
            ? Center(
                child: Text(
                  'No Data',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: Get.mediaQuery.padding.left + 20.0,
                  right: Get.mediaQuery.padding.right + 20.0,
                  top: Get.mediaQuery.padding.top - 10.0,
                ),
                child: GenerateNote(notes: databaseController.notes),
              ),
      ),
      floatingActionButton: floatingAddData(),
    );
  }
}
