class Menu {
  int id;
  String gambar;
  String nama;
  List<String> komposisi;
  Map<String, int> jumlahPorsi;
  String satuan;
  List<String> jenisBerlangganan;

  Menu({
    required this.id,
    required this.gambar,
    required this.nama,
    required this.komposisi,
    required this.jumlahPorsi,
    required this.satuan,
    required this.jenisBerlangganan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gambar': gambar,
      'nama': nama,
      'komposisi': komposisi,
      'jumlahPorsi': jumlahPorsi,
      'satuan': satuan,
      'jenisBerlangganan': jenisBerlangganan,
    };
  }

  @override
  String toString() {
    return "id : $id\ngambar : $gambar\nnama : $nama\nkomposisi : $komposisi\njumlahPorsi : $jumlahPorsi\nsatuan : $satuan\njenisBerlangganan : $jenisBerlangganan";
  }
}

// List<Menu> daftarMenu = [
//   Menu(
//     gambar: 'Telur_Sambal.png',
//     nama: 'Telur Bulat Sambal',
//     komposisi: [
//       'Telur Ayam',
//       'Cabe Merah',
//       'Bawang Merah',
//       'Bawang Putih',
//       'Asam Keping',
//       'Gula',
//       'Garam'
//     ],
//     jumlahPorsi: {'hemat': 1, 'regular': 1, 'extra': 2, 'keluarga': 4},
//     satuan: 'Butir',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Bakwan_Jagung.png',
//     nama: 'Bakwan Jagung',
//     komposisi: [
//       'Jagung Manis',
//       'Bawang Putih',
//       'Tepung Terigu',
//       'Garam',
//       'Daun Bawang'
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 2, "Extra": 3, "Keluarga": 5},
//     satuan: 'Buah',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Ayam_Rendang.png',
//     nama: 'Ayam Rendang',
//     komposisi: [
//       "Ayam negri (potong-potong)",
//       "Kentang (mini)",
//       "Santan kelapa kental",
//       "Santan cair",
//       "Kelapa parut",
//       "Serai (memarkan)",
//       "Daun jeruk (bunag bagian batang)",
//       "Asam kandis",
//       "Daun kunyit",
//       "Bawang merah",
//       "Bawang putih",
//       "Cabe merah",
//       "Cabe merah keriting",
//       "Ketumbar",
//       "Jahe",
//       "Kunyit",
//       "Merica secukupnya",
//       "Lengkuas",
//       "Garam dapur"
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 1, "Extra": 1, "Keluarga": 1},
//     satuan: 'Bks',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Sop_Ayam.png',
//     nama: 'Sop Ayam Biasa',
//     komposisi: [
//       'Daging Ayam',
//       'Wortel',
//       'Kentang',
//       'Seledri',
//       'Buncis',
//       'Daun kol',
//       'Daun prei',
//       'Daun Bawang',
//       'Jahe',
//       'Bawang Goreng',
//       'Tomat',
//       'Merica',
//       'Garam',
//       'Gula'
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 1, "Extra": 1, "Keluarga": 1},
//     satuan: 'Bks',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Soto_Ayam.jpg',
//     nama: 'Soto Ayam',
//     komposisi: [
//       'Ayam Potong',
//       'Air',
//       'Batang serai',
//       'Daun salam',
//       'Bawang Putih',
//       'Bawang Merah',
//       'Kemiri',
//       'Kunyit',
//       'Jahe',
//       'Merica',
//       'Garam',
//       'Tauge',
//       'Daun Bawang',
//       'Jeruk Nipis'
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 1, "Extra": 1, "Keluarga": 1},
//     satuan: 'Bks',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Ikan_Kembung_Sambal_Goreng.png',
//     nama: 'Ikan Kembung Sambal Goreng',
//     komposisi: [
//       'Ikan Kembung',
//       'Gula',
//       'Daun Kemangi',
//       'Bawang Merah',
//       'Bawang Putih',
//       'Cabe Merah Keriting',
//       'Tomat Merah'
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 1, "Extra": 2, "Keluarga": 4},
//     satuan: 'Bks',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
//   Menu(
//     gambar: 'Sambal_Kacang_Goreng_Teri.png',
//     nama: 'Sambal Kacang Goreng Teri',
//     komposisi: [
//       'Teri',
//       'Kacang Tanah',
//       'Daun Jeruk',
//       'Daun Salam',
//       'Air Asam Jawa',
//       'Gula',
//       'Garam',
//       'Minyak'
//     ],
//     jumlahPorsi: {"Hemat": 1, "Regular": 1, "Extra": 1, "Keluarga": 1},
//     satuan: 'Bks',
//     jenisBerlangganan: ['Hemat', 'Regular', 'Extra', 'Keluarga'],
//   ),
// ];
