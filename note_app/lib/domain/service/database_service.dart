import 'package:intl/intl.dart';
import 'package:note_app/data/models/model_notes.dart';
import 'package:note_app/data/repository/note_local_repo.dart';
import 'package:note_app/modules/utils/generate_color_and_id.dart';

/// Database service or Facade Class
class DatabaseService {
  final DatabaseHelper database;

  DatabaseService({required this.database});

  Future<void> addData(String title, String body) async {
    /// if user input title and body data, then add to database
    if (title.isNotEmpty && body.isNotEmpty) {
      await database.add(
        Note(
          id: Generate.generateId(),
          title: title,
          body: body,
          dateTime: DateTime.now().toString(),
          color: Generate.colors[Generate.generateHexaColor()].value,
        ),
      );

      /// if user doesn't input title data, then set data title from date time now
    } else if (title.isEmpty && body.isNotEmpty) {
      title = 'Note Created At ${DateFormat.Md().format(DateTime.now())}';
      await database.add(
        Note(
          id: Generate.generateId(),
          title: title,
          body: body,
          dateTime: DateTime.now().toString(),
          color: Generate.colors[Generate.generateHexaColor()].value,
        ),
      );

      /// if user doesn't input body data, then set body data empty string
    } else if (title.isNotEmpty && body.isEmpty) {
      body = '';
      await database.add(
        Note(
          id: Generate.generateId(),
          title: title,
          body: body,
          dateTime: DateTime.now().toString(),
          color: Generate.colors[Generate.generateHexaColor()].value,
        ),
      );
    }

    /// default if title and body is empty, then note data doesn't add to database
  }

  Future<List<Note>> getData() async => database.read();
  Future<void> updateData(
    String id,
    String title,
    String body,
    String dateTime,
    int color,
  ) async {
    /// if user input title and body data, then update data to database
    if (title.isNotEmpty && body.isNotEmpty) {
      await database.update(
        Note(
          id: id,
          title: title,
          body: body,
          dateTime: dateTime,
          color: color,
        ),
      );

      /// if user doesn't input title data, then set data title from date time now
    } else if (title.isEmpty && body.isNotEmpty) {
      title = 'Note Created At ${DateFormat.Md().format(DateTime.now())}';
      await database.update(
        Note(
          id: id,
          title: title,
          body: body,
          dateTime: dateTime,
          color: color,
        ),
      );
    } else if (title.isNotEmpty && body.isEmpty) {
      /// if user doesn't input body data, then set body data empty string
      body = '';
      await database.update(
        Note(
          id: id,
          title: title,
          body: body,
          dateTime: dateTime,
          color: color,
        ),
      );
    }

    /// default if title and body is empty, then note data doesn't update to database
  }

  Future<void> deleteData(String id) async => database.delete(id);
}
