import 'package:get/get.dart';
import 'package:note_app/data/models/model_notes.dart';
import 'package:note_app/data/repository/note_local_repo.dart';
import 'package:note_app/domain/service/database_service.dart';

/// database controller
class DatabaseController extends GetxController {
  late DatabaseService _databaseService;
  final _notes = Rx<List<Note>>([]);
  final _notesBySearch = Rx<List<Note>>([]);
  final _keyword = Rx<String>('');

  @override
  void onInit() async {
    super.onInit();

    /// getx worker for check every single change on keyword variable
    debounce(
      _keyword,
      (_) => setNotesBySearch(),
    );

    /// open database for first time
    await openDatabase();

    /// set notes data for display to user
    await setNotesData();
  }

  /// notes setter and getter
  List<Note> get notes => _notes.value;
  set notes(notes) => _notes.value = notes;

  /// notes by search setter and getter
  List<Note> get notesBySearch => _notesBySearch.value;
  set notesBySearch(List<Note> notesBySearch) =>
      _notesBySearch.value = notesBySearch;

  /// keyword setter and getter
  String get keyword => _keyword.value;
  set keyword(keyword) => _keyword.value = keyword;

  /// method for open database
  Future<void> openDatabase() async {
    _databaseService = DatabaseService(database: SqliteHelper());
    await _databaseService.database.initDatabase();
  }

  /// method for set notes by search
  void setNotesBySearch() {
    if (keyword.isEmpty)
      notesBySearch = [];
    else {
      var getNotes = notes
          .where(
            (element) =>
                element.title.toLowerCase().contains(keyword.toLowerCase()) ||
                element.body.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
      notesBySearch = (getNotes.isEmpty) ? [] : getNotes;
    }
    setNotesData();
  }

  /// method for add data to database
  void addData({
    required String title,
    required String body,
  }) async {
    /// if user input title and body data, then add to database
    await _databaseService.addData(title, body);

    /// get and set new notes data
    await setNotesData();
  }

  /// method for update data to database
  void updateData({
    required String id,
    required String title,
    required String body,
    required String dateTime,
    required int color,
  }) async {
    await _databaseService.updateData(id, title, body, dateTime, color);

    /// get and set new notes data
    await setNotesData();
    setNotesBySearch();
  }

  /// method for delete data to database
  void deleteData(String id) async {
    await _databaseService.deleteData(id);
    await setNotesData();
  }

  /// get and set notes data from database for display to user
  Future<void> setNotesData() async {
    notes = await _databaseService.getData();
  }
}
