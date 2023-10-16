import 'package:cateringapp/backend/data/Menu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  Database? _database;
  final String _table_product = "Product";
  final String _db_name = "CateringApp.db";
  final int _db_version = 1;

  DBHelper() {
    // sqfliteFfiInit();
    // databaseFactory = databaseFactoryFfi;
    _openDB();
  }

  Future<void> _openDB() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), _db_name),
      onCreate: (db, version) {
        db.execute('''
            CREATE TABLE $_table_product (
              id INTEGER PRIMARY KEY,
              nama TEXT,
              gambar TEXT,
              komposisi TEXT,
              jumlahPorsi TEXT,
              satuan TEXT,
              jenisBerlangganan TEXT
            )
          ''');
        // Insert initial data
        db.rawInsert('''
            INSERT INTO $_table_product VALUES (1, "Telur Bulat Sambal", "Telur_Sambal.png", "["Telur Ayam","Cabe Merah","Bawang Merah","Bawang Putih","Asam Keping","Gula","Garam"]", "{"hemat":1,"regular":1,"extra":2,"keluarga":4}", "Butir", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (2, "Bakwan Jagung", "Bakwan_Jagung.png", "["Jagung Manis","Bawang Putih","Tepung Terigu","Garam","Daun Bawang"]", "{"hemat":1,"regular":2,"extra":3,"keluarga":5}", "Buah", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (3, "Ayam Rendang", "Ayam_Rendang.png", "["Ayam negri (potong-potong)","Kentang (mini)","Santan kelapa kental","Santan cair","Kelapa parut","Serai (memarkan)","Daun jeruk (bunag bagian batang)","Asam kandis","Daun kunyit","Bawang merah","Bawang putih","Cabe merah","Cabe merah keriting","Ketumbar","Jahe","Kunyit","Merica secukupnya","Lengkuas","Garam dapur"]", "{"hemat":1,"regular":1,"extra":1,"keluarga":1}", "Bks", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (4, "Sop Ayam Biasa", "Sop_Ayam.png", "["Daging Ayam","Wortel","Kentang","Seledri","Buncis","Daun kol","Daun prei","Daun Bawang","Jahe","Bawang Goreng","Tomat","Merica","Garam","Gula"]", "{"hemat":1,"regular":1,"extra":1,"keluarga":1}", "Bks", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (5, "Soto Ayam", "Soto_Ayam.png", "["Ayam Potong","Air","Batang serai","Daun salam","Bawang Putih","Bawang Merah","Kemiri","Kunyit","Jahe","Merica","Garam","Tauge","Daun Bawang","Jeruk Nipis"]", "{"hemat":1,"regular":1,"extra":1,"keluarga":1}", "Bks", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (6, "Ikan Kembung Sambal Goreng", "Ikan_Kembung_Sambal_Goreng.png", "["Ikan Kembung","Gula","Daun Kemangi","Bawang Merah","Bawang Putih","Cabe Merah Keriting","Tomat Merah"]", "{"hemat":1,"regular":1,"extra":2,"keluarga":4}", "Bks", "["Hemat","Regular","Extra","Keluarga"])
            INSERT INTO $_table_product VALUES (7, "Sambal Kacang Goreng Teri", "Sambal_Kacang_Goreng_Teri.png", "["Teri","Kacang Tanah","Daun Jeruk","Daun Salam","Air Asam Jawa","Gula","Garam","Minyak"]", "{"hemat":1,"regular":1,"extra":1,"keluarga":1}", "Bks", "["Hemat","Regular","Extra","Keluarga"])
          ''');
        // Insert other initial data here...
      },
      version: _db_version,
    );
  }

  Future<void> insertMenu(Menu tmp) async {
    await _database?.insert(
      _table_product,
      tmp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Menu>> getMyMenu() async {
    if (_database != null) {
      final List<Map<String, dynamic>> maps =
          await _database!.query(_table_product);
      return List.generate(
        maps.length,
        (i) {
          return Menu(
            id: maps[i]['id'],
            gambar: maps[i]['gambar'],
            nama: maps[i]['nama'],
            komposisi: maps[i]['komposisi'],
            jumlahPorsi: maps[i]['jumlahPorsi'],
            satuan: maps[i]['satuan'],
            jenisBerlangganan: maps[i]['jenisBerlangganan'],
          );
        },
      );
    }
    return [];
  }

  Future<void> closeDB() async {
    await _database?.close();
  }
}
