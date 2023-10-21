import 'package:cateringapp/backend/data/models/Menu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? _database;
  final String _table_product = "Product";
  final String _db_name = "CateringApp.db";
  final int _db_version = 2;

  DBHelper() {
    _openDB();
  }

  Future<void> _openDB() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), _db_name),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $_table_product (id INTEGER PRIMARY KEY, json TEXT)',
        );
      },
      version: _db_version,
    );
  }

  Future<void> insertData(int id, String json) async {
    await _database?.rawInsert(
      'INSERT OR REPLACE INTO $_table_product (id, json) VALUES (?,?)',
      [id, json],
    );
  }

  Future<List<Menu>> getMyMenu() async {
    if (_database != null) {
      final List<Map<String, dynamic>> data =
          await _database!.query(_table_product);
      List<Menu> listMenu = [];
      for (var i in data) {
        listMenu.add(Menu.fromRawJson(i['json']));
      }
      return listMenu;
    }
    return [];
  }

  Future<void> deleteAll() async {
    await _database?.delete(_table_product);
  }

  Future<void> closeDB() async {
    await _database?.close();
  }
}
