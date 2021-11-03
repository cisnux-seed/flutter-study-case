import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:note_app/data/models/model_notes.dart';
import 'package:note_app/modules/controllers/database_controller.dart';
import 'package:note_app/modules/profile/controllers/profile_controller.dart';
import 'package:note_app/modules/utils/parse_date_time.dart';
import 'package:note_app/modules/widgets/note_custom_button.dart';

/// note profile view
class NoteProfileView extends StatelessWidget {
  /// get controller in property class not in method build
  /// to avoid inherited controller to other widget on widget tree
  final databaseController = Get.find<DatabaseController>();
  final profileController = Get.find<ProfileNoteController>();

  /// get note profile from home view or search view for edit
  final Note note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    profileController.setProfileNote(note);

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
                      databaseController.updateData(
                        id: note.id,
                        title: profileController.title.text,
                        body: profileController.body.text,
                        dateTime: note.dateTime,
                        color: note.color,
                      );
                      Get.back();
                    },
                  ),
                  Obx(
                    () => profileController.isReadOnly.value
                        ? Row(
                            children: [
                              NoteCustomButton(
                                child: Center(
                                  child: LineIcon.editAlt(
                                    size: 28.0,
                                    color: Colors.white,
                                  ),
                                ),
                                color: context.theme.buttonColor,
                                heightButton: context.height * 0.055,
                                widthButton: context.width * 0.15,
                                onTap: () =>
                                    profileController.enableAutoFocus(),
                              ),
                              SizedBox(width: 10.0),
                              NoteCustomButton(
                                child: Center(
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                color: context.theme.buttonColor,
                                heightButton: context.height * 0.055,
                                widthButton: context.width * 0.15,
                                onTap: () {
                                  databaseController.deleteData(
                                    note.id,
                                  );
                                  Get.back();
                                },
                              ),
                            ],
                          )
                        : NoteCustomButton(
                            child: Center(
                              child: Text(
                                'Save',
                                style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            color: context.theme.buttonColor,
                            heightButton: context.height * 0.055,
                            widthButton: context.width * 0.18,
                            onTap: () {
                              profileController.enableAutoFocus();
                              databaseController.updateData(
                                id: note.id,
                                title: profileController.title.text,
                                body: profileController.body.text,
                                dateTime: note.dateTime,
                                color: note.color,
                              );
                            },
                          ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Obx(
                    () => Column(
                      children: [
                        SizedBox(height: 10.0),
                        TextField(
                          controller: profileController.title,
                          style: GoogleFonts.poppins(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          autofocus: true,
                          readOnly: profileController.isReadOnly.value,
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            ParseDateTime.parseDateTime(note.dateTime),
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          controller: profileController.body,
                          style: GoogleFonts.poppins(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                          readOnly: profileController.isReadOnly.value,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
