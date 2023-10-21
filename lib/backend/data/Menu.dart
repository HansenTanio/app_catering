import 'dart:convert';

class Menu {
  String gambar;
  String nama;
  List<String> komposisi;
  JumlahPorsi jumlahPorsi;
  String satuan;
  List<String> jenisBerlangganan;

  Menu({
    required this.gambar,
    required this.nama,
    required this.komposisi,
    required this.jumlahPorsi,
    required this.satuan,
    required this.jenisBerlangganan,
  });

  factory Menu.fromRawJson(String str) => Menu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        gambar: json["gambar"],
        nama: json["nama"],
        komposisi: List<String>.from(json["komposisi"].map((x) => x)),
        jumlahPorsi: JumlahPorsi.fromJson(json["jumlahPorsi"]),
        satuan: json["satuan"],
        jenisBerlangganan:
            List<String>.from(json["jenisBerlangganan"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gambar": gambar,
        "nama": nama,
        "komposisi": List<dynamic>.from(komposisi.map((x) => x)),
        "jumlahPorsi": jumlahPorsi.toJson(),
        "satuan": satuan,
        "jenisBerlangganan":
            List<dynamic>.from(jenisBerlangganan.map((x) => x)),
      };
}

class JumlahPorsi {
  int hemat;
  int regular;
  int extra;
  int keluarga;

  JumlahPorsi({
    required this.hemat,
    required this.regular,
    required this.extra,
    required this.keluarga,
  });

  factory JumlahPorsi.fromRawJson(String str) =>
      JumlahPorsi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JumlahPorsi.fromJson(Map<String, dynamic> json) => JumlahPorsi(
        hemat: json["hemat"],
        regular: json["regular"],
        extra: json["extra"],
        keluarga: json["keluarga"],
      );

  Map<String, dynamic> toJson() => {
        "hemat": hemat,
        "regular": regular,
        "extra": extra,
        "keluarga": keluarga,
      };
}
