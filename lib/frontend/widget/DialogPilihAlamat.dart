import 'package:flutter/material.dart';
import 'dart:async';

class DialogPilihAlamat extends StatefulWidget {
  @override
  _DialogPilihAlamatState createState() => _DialogPilihAlamatState();
}

class Address {
  final String name;
  final String address;

  Address(this.name, this.address);
}

class MenuItem {
  final String name;
  final String description;
  final double price;

  MenuItem(this.name, this.description, this.price);
}

class BackendService {
  // Simulasikan data alamat pengiriman
  static List<Address> addresses = [
    Address('Sun Plaza', 'Jalan Pemuda No. 123'),
    Address('Mall ABC', 'Jalan Raya No. 456'),
  ];

  // Simulasikan menu harian
  static List<MenuItem> dailyMenu = [
    MenuItem('Nasi Goreng', 'Nasi goreng spesial', 15.0),
    MenuItem('Mie Ayam', 'Mie ayam lezat', 12.0),
    MenuItem('Soto Ayam', 'Soto ayam hangat', 10.0),
  ];

  // Fungsi untuk mendapatkan data alamat pengiriman
  static Future<List<Address>> getAddresses() async {
    await Future.delayed(Duration(seconds: 1)); // Simulasi penundaan jaringan
    return addresses;
  }

  // Fungsi untuk mendapatkan menu harian
  static Future<List<MenuItem>> getDailyMenu() async {
    await Future.delayed(Duration(seconds: 1)); // Simulasi penundaan jaringan
    return dailyMenu;
  }

  // Fungsi untuk memesan makanan
  static Future<bool> placeOrder(
      Address selectedAddress, List<MenuItem> selectedItems) async {
    await Future.delayed(Duration(seconds: 2)); // Simulasi penundaan pemesanan
    return true; // Pemesanan berhasil
  }
}

class _DialogPilihAlamatState extends State<DialogPilihAlamat> {
  void _pilihAlamat(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Full Page Dialog'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Ini adalah konten dari full page dialog.',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedAddress =
                          Address('Sun Plaza', 'Jalan Pemuda No. 123');
                      final selectedItems = [
                        MenuItem('Nasi Goreng', 'Nasi goreng spesial', 15.0)
                      ];
                      final result = await BackendService.placeOrder(
                          selectedAddress, selectedItems);
                      if (result) {
                        print('Pesanan berhasil dipesan.');
                        // Tampilkan pesan sukses
                      } else {
                        print('Gagal memesan pesanan.');
                        // Tampilkan pesan kesalahan
                      }
                    },
                    child: Text('Pesan Sekarang'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _pilihAlamat(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Antar ke",
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              FutureBuilder<List<Address>>(
                future: BackendService.getAddresses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Tidak ada alamat yang tersedia.');
                  } else {
                    final selectedAddress = snapshot.data![0];
                    return Row(
                      children: [
                        Text(selectedAddress.name),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
