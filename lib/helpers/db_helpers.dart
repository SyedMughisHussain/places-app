import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "places.db");
    var theDb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE user_places(id INTEGER PRIMARY KEY, title TEXT, image TEXT)");
      },
    );
    return theDb;
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final dbClient = await db;
    dbClient!.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchAndSetData(String table) async {
    final dbClient = await db;
    return dbClient!.query(table);
  }
}
