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
      join("assets/database", _db_name),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $_table_product (id INTEGER PRIMARY KEY, json TEXT)',
        );
      },
      version: _db_version,
    );
    initialData();
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

  void initialData() async {
    insertData(1, """{
            "gambar": "Telur_Sambal.png",
            "nama": "Telur Bulat Sambal",
            "komposisi": [
                "Telur Ayam",
                "Cabe Merah",
                "Bawang Merah",
                "Bawang Putih",
                "Asam Keping",
                "Gula",
                "Garam"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 2,
                "keluarga": 4
            },
            "satuan": "Butir",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(2, """{
            "gambar": "Bakwan_Jagung.png",
            "nama": "Bakwan Jagung",
            "komposisi": [
                "Jagung Manis",
                "Bawang Putih",
                "Tepung Terigu",
                "Garam",
                "Daun Bawang"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 2,
                "extra": 3,
                "keluarga": 5
            },
            "satuan": "Buah",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(3, """{
            "gambar": "Ayam_Rendang.png",
            "nama": "Ayam Rendang",
            "komposisi": [
                "Ayam negri (potong-potong)",
                "Kentang (mini)",
                "Santan kelapa kental",
                "Santan cair",
                "Kelapa parut",
                "Serai (memarkan)",
                "Daun jeruk (bunag bagian batang)",
                "Asam kandis",
                "Daun kunyit",
                "Bawang merah",
                "Bawang putih",
                "Cabe merah",
                "Cabe merah keriting",
                "Ketumbar",
                "Jahe",
                "Kunyit",
                "Merica secukupnya",
                "Lengkuas",
                "Garam dapur"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 1,
                "keluarga": 1
            },
            "satuan": "Bks",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(4, """{
            "gambar": "Sop_Ayam.png",
            "nama": "Sop Ayam Biasa",
            "komposisi": [
                "Daging Ayam",
                "Wortel",
                "Kentang",
                "Seledri",
                "Buncis",
                "Daun kol",
                "Daun prei",
                "Daun Bawang",
                "Jahe",
                "Bawang Goreng",
                "Tomat",
                "Merica",
                "Garam",
                "Gula"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 1,
                "keluarga": 1
            },
            "satuan": "Bks",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(5, """{
            "gambar": "Soto_Ayam.jpg",
            "nama": "Soto Ayam",
            "komposisi": [
                "Ayam Potong",
                "Air",
                "Batang serai",
                "Daun salam",
                "Bawang Putih",
                "Bawang Merah",
                "Kemiri",
                "Kunyit",
                "Jahe",
                "Merica",
                "Garam",
                "Tauge",
                "Daun Bawang",
                "Jeruk Nipis"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 1,
                "keluarga": 1
            },
            "satuan": "Bks",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(6, """{
            "gambar": "Ikan_Kembung_Sambal_Goreng.png",
            "nama": "Ikan Kembung Sambal Goreng",
            "komposisi": [
                "Ikan Kembung",
                "Gula",
                "Daun Kemangi",
                "Bawang Merah",
                "Bawang Putih",
                "Cabe Merah Keriting",
                "Tomat Merah"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 2,
                "keluarga": 4
            },
            "satuan": "Bks",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
    insertData(7, """{
            "gambar": "Sambal_Kacang_Goreng_Teri.png",
            "nama": "Sambal Kacang Goreng Teri",
            "komposisi": [
                "Teri",
                "Kacang Tanah",
                "Daun Jeruk",
                "Daun Salam",
                "Air Asam Jawa",
                "Gula",
                "Garam",
                "Minyak"
            ],
            "jumlahPorsi": {
                "hemat": 1,
                "regular": 1,
                "extra": 1,
                "keluarga": 1
            },
            "satuan": "Bks",
            "jenisBerlangganan": [
                "hemat",
                "regular",
                "extra",
                "keluarga"
            ]
        }""");
  }
}
