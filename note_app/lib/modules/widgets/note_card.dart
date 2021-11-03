import 'package:flutter/material.dart';
import 'package:note_app/modules/utils/parse_date_time.dart';

/// Note Card to display on home view and search view
class NoteCard extends StatelessWidget {
  final Alignment titleAlignment;
  final Alignment dateTimeAlignment;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry dateTimePadding;
  final TextStyle titleStyle;
  final TextStyle dateTimeStyle;
  final String title;
  final String dateTime;
  final TextOverflow titleOverflow;

  NoteCard({
    Key? key,
    required this.titleAlignment,
    required this.dateTimeAlignment,
    required this.titlePadding,
    required this.dateTimePadding,
    required this.titleStyle,
    required this.dateTimeStyle,
    this.title = '',
    this.dateTime = '',
    this.titleOverflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: titleAlignment,
            child: Container(
              padding: titlePadding,
              child: Text(
                title,
                style: titleStyle,
                overflow: titleOverflow,
              ),
            ),
          ),
        ),
        Align(
          alignment: dateTimeAlignment,
          child: Padding(
            padding: dateTimePadding,
            child: Text(
              ParseDateTime.parseDateTime(dateTime),
              style: dateTimeStyle,
            ),
          ),
        ),
      ],
    );
  }
}
