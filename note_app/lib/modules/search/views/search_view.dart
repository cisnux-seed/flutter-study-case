import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/modules/controllers/database_controller.dart';
import 'package:note_app/modules/search/controllers/search_controller.dart';
import 'package:note_app/modules/widgets/generate_notes.dart';
import 'package:note_app/routes/app_routes.dart';

/// Search view
class SearchView extends StatelessWidget {
  /// get controller in property class not in method build
  /// to avoid inherited controller to other widget on widget tree
  final databaseController = Get.find<DatabaseController>();
  final searchController = Get.find<SearchNoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(
                left: context.mediaQuery.padding.left + 17.0,
                right: context.mediaQuery.padding.right + 17.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    iconSize: context.height * 0.028,
                    onPressed: () {
                      Get.offAllNamed(RouteName.homeView);
                      databaseController.keyword = '';
                    },
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextField(
                      controller: searchController.search,
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      onChanged: (keyword) =>
                          databaseController.keyword = keyword,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Search something...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20.0,
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.0),
            Expanded(
              child: Obx(
                () => databaseController.notesBySearch.isEmpty
                    ? Center(
                        child: Text(
                          'No Data Found',
                          style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          left: context.mediaQuery.padding.left + 30.0,
                          right: context.mediaQuery.padding.right + 30.0,
                        ),
                        child: GenerateNote(
                            notes: databaseController.notesBySearch),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
