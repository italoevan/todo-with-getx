import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
  static Future<Database> getDatabase(
      {String? onCreate, required databaseName}) async {
    String path = join(await getDatabasesPath(), databaseName);

    return openDatabase(path, version: 1, onCreate: (database, v) async {
      await database.execute(onCreate ?? "");
    });
  }
}
