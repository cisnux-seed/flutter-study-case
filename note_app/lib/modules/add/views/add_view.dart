import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/modules/add/controllers/add_controller.dart';
import 'package:note_app/modules/controllers/database_controller.dart';
import 'package:note_app/modules/widgets/note_custom_button.dart';

class AddNote extends StatelessWidget {
  /// get controller in property class not in method build
  /// to avoid inherited controller to other widget on widget tree
  final databaseController = Get.find<DatabaseController>();
  final addController = Get.find<AddNoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.mediaQuery.padding.left + 17.0,
            right: context.mediaQuery.padding.right + 17.0,
            top: context.mediaQuery.padding.top - 10.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NoteCustomButton(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    color: context.theme.buttonColor,
                    heightButton: context.height * 0.055,
                    widthButton: context.width * 0.15,
                    onTap: () {
                      databaseController.addData(
                        title: addController.title.text,
                        body: addController.body.text,
                      );
                      Get.back();
                    },
                  ),
                  NoteCustomButton(
                    child: Text(
                      'Save',
                      style: GoogleFonts.notoSans(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    color: context.theme.buttonColor,
                    heightButton: context.height * 0.055,
                    widthButton: context.width * 0.18,
                    onTap: () {
                      databaseController.addData(
                        title: addController.title.text,
                        body: addController.body.text,
                      );
                      Get.back();
                    },
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      TextField(
                        controller: addController.title,
                        style: GoogleFonts.poppins(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 40.0,
                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: addController.body,
                        style: GoogleFonts.poppins(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Type something...',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 25.0,
                          ),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
