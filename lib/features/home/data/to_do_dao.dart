import 'package:sqflite/sqflite.dart';
import 'package:to_do_getx/core/data/app_database.dart';
import 'package:to_do_getx/core/models/home_models/todo.dart';

abstract class TodoDao {
  static const String tableName = "todo";
  static const String _onCreate =
      "CREATE TABLE $tableName (id INTEGER PRIMARY KEY,description TEXT, dateTime TEXT) ";

  static Future insert(Todo model) async {
    Database database = await AppDatabase.getDatabase(
      databaseName: tableName,
      onCreate: TodoDao._onCreate,
    );

    await database.insert(tableName, model.toMap());
  }

  static Future<List<Todo>> read() async {
    Database database = await AppDatabase.getDatabase(
      databaseName: tableName,
      onCreate: TodoDao._onCreate,
    );

    List<Map<String, dynamic>> response = await database.query(tableName);

    List<Todo> list = [];

    for (var element in response) {
      list.add(Todo.fromMap(element));
    }

    list.sort();

    return list;
  }

  static Future removeById(int id) async {
    Database database = await AppDatabase.getDatabase(
        databaseName: tableName, onCreate: _onCreate);
    await database.rawDelete("DELETE FROM $tableName WHERE ID = ?", [id]);

    return;
  }

  static Future edit(Todo model) async {
    Database database = await AppDatabase.getDatabase(
        databaseName: tableName, onCreate: _onCreate);
    await database.rawUpdate(
        "UPDATE $tableName SET description = ? WHERE id = ?",
        [model.description, model.id]);
    return;
  }
}
