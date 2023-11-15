import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/models/todo.dart';

class DBHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
      "CREATE TABLE todos("
      "id INTEGER PRIMARY KEY AUTOINCREAMENT,"
      "title STRING, desc TEXT, date STRING,"
      "startTime STRING, endTime STRING,"
      "remind INTEGER, repeat STRING,"
      "isCompleted INTEGER"
      ")",
    );

    await database.execute(
      "CREATE TABLE user("
      " id INTEGER PRIMARY KEY AUTOINCREAMENT DEFAULT 0, isverified INTEGER)",
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'LoveFlutter',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createItem(Todo todo) async {
    final db = await DBHelper.db();
    final id = await db.insert("todo", todo.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();

    final data = {'id': 1, 'isVerified': isVerified};

    final id = await db.insert("user", data);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DBHelper.db();

    return db.query("user", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();

    return db.query('todos', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();

    return db.query('todos', where: "id == ? ", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String title, String desc,
      int isCompleted, String date, String startTime, String endTime) async {
    final db = await DBHelper.db();

    final data = {
      'title': title,
      'desc': desc,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    };

    final result =
        await db.update('todos', data, where: 'id == ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();

    try {
      db.delete('todos', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
