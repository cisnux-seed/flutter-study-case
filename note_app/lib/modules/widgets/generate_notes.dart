import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/data/models/model_notes.dart';
import 'package:note_app/modules/widgets/note_card.dart';
import 'package:note_app/modules/utils/get_axis_ratio.dart';
import 'package:get/get.dart';
import 'package:note_app/routes/app_routes.dart';

/// Generate notes to display on home view and search view
class GenerateNote extends StatelessWidget {
  final List<Note> notes;

  const GenerateNote({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: ClampingScrollPhysics(),
      itemCount: notes.length,
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 15.0,
      itemBuilder: (_, index) => Material(
        color: Color(notes[index].color),
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          splashColor: Colors.cyan.shade50,
          borderRadius: BorderRadius.circular(20.0),
          onTap: () => Get.toNamed(
            RouteName.profileView,
            arguments: notes[index],
          ),
          child: Container(
            /// check note card is horizontal or vertical
            /// is equal to 1, then note card is horizontal
            /// is equal to 2, then note card is vertical
            child: (Ratio.getCrossRatio(index) == 1)
                ? NoteCard(
                    title: notes[index].title,
                    dateTime: notes[index].dateTime,
                    titleOverflow: TextOverflow.fade,
                    titleAlignment: Alignment.topLeft,
                    dateTimeAlignment: Alignment.bottomLeft,
                    titlePadding: EdgeInsets.only(
                      top: 13.0,
                      bottom: 4.0,
                      left: 18.0,
                      right: 23.0,
                    ),
                    dateTimePadding: EdgeInsets.only(
                      bottom: 11.0,
                      left: 18.0,
                    ),
                    titleStyle: GoogleFonts.poppins(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    dateTimeStyle: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.black45,
                    ),
                  )
                : NoteCard(
                    title: notes[index].title,
                    dateTime: notes[index].dateTime,
                    titleOverflow: TextOverflow.fade,
                    titleAlignment: Alignment.topLeft,
                    dateTimeAlignment: Alignment.bottomRight,
                    titlePadding: EdgeInsets.only(
                      right: 160.0,
                      left: 18.0,
                      top: 13.0,
                      bottom: 11.0,
                    ),
                    dateTimePadding: EdgeInsets.only(
                      right: 18.0,
                      bottom: 11.0,
                    ),
                    titleStyle: GoogleFonts.poppins(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    dateTimeStyle: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.black45,
                    ),
                  ),
          ),
        ),
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
        Ratio.getCrossRatio(index),
        Ratio.getMainRatio(index),
      ),
    );
  }
}
