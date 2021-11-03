import '../models/model_notes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// Abastract
// DAO(Data Access Object) or Repository class
abstract class DatabaseHelper {
  initDatabase();
  add(Note note);
  read();
  update(Note note);
  delete(String id);
}

// Concreate class of DAO or Reposotory
class SqliteHelper implements DatabaseHelper {
  static final SqliteHelper _sqliteHelper = SqliteHelper._createObject();

  factory SqliteHelper() => _sqliteHelper;

  SqliteHelper._createObject();

  @override
  Future<Database> initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var noteDatabase = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT, body TEXT, dateTime TEXT, color INTEGER)',
      ),
    );
    return noteDatabase;
  }

  Future<Database> _getDatabase() async {
    Database _database = await initDatabase();
    return _database;
  }

  @override
  Future<void> add(Note note) async {
    final db = await _getDatabase();
    db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Note>> read() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> notes = await db.query(
      'notes',
      orderBy: 'dateTime',
    );

    return List.generate(
      notes.length,
      (index) => Note.fromMap(notes[index]),
    );
  }

  @override
  Future<void> update(Note note) async {
    final db = await _getDatabase();
    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  @override
  Future<void> delete(String id) async {
    final db = await _getDatabase();
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
