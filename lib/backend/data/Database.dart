import 'package:cateringapp/backend/data/Menu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

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
        // print(i['json'].runtimeType);
        listMenu.add(Menu.fromRawJson(i['json']));
      }
      return listMenu;
      // return data.toString();
      // return maps;
      // return List.generate(
      //   maps.length,
      //   (i) {
      //     return Menu(
      //       id: maps[i]['id'],
      //       gambar: maps[i]['gambar'],
      //       nama: maps[i]['nama'],
      //       komposisi: maps[i]['komposisi'],
      //       jumlahPorsi: maps[i]['jumlahPorsi'],
      //       satuan: maps[i]['satuan'],
      //       jenisBerlangganan: maps[i]['jenisBerlangganan'],
      //     );
      //   },
      // );
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
