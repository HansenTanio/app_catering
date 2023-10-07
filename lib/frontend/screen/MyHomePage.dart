import 'package:cateringapp/frontend/widget/Pengkategorian.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../widget/GambarCorusel.dart';
// import '../widget/KotakMenu1.dart';
import 'BerlanggananPage.dart';
import 'ProfilePage.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController(initialPage: 0);
  DateTime _selectedDate = DateTime.now(); // Tanggal yang dipilih
  int _selectedIndex = 0; // Indeks tab yang dipilih
  int _selectedButtomIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedButtomIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
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
                )),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset('logo/logo.png', width: 50),
                  Image.asset('logo/teks.png', width: 80),
                ],
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedButtomIndex = index;
          });
        },
        children: [
          Container(
            child: Column(
              children: <Widget>[
                GambarCarousel(), // Memanggil widget GambarCarousel
                Row(
                  children: List.generate(7, (index) {
                    final tabDate = _selectedDate.add(Duration(days: index));
                    return buildTabButton(index, tabDate);
                  }),
                ),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 320,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 228, 228, 228)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Menu Langganan Regular : 400k",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: reguler(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 20,
                                color: Colors.black,
                              ),
                              Container(
                                height: 320,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 228, 228, 228)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Menu Langganan Premium : 600k",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: reguler(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.black,
                              ),
                              Container(
                                height: 320,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 228, 228, 228)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Menu Langganan Keluarga : 1.2jt",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: reguler(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // Konten untuk Selasa
                        child: Text('Konten untuk Selasa'),
                      ),
                      Container(
                        // Konten untuk Rabu
                        child: Text('Konten untuk Rabu'),
                      ),
                      Container(
                        // Konten untuk Kamis
                        child: Text('Konten untuk Kamis'),
                      ),
                      Container(
                        // Konten untuk Jumat
                        child: Text('Konten untuk Jumat'),
                      ),
                      Container(
                        // Konten untuk Sabtu
                        child: Text('Konten untuk Sabtu'),
                      ),
                      Container(
                        // Konten untuk Minggu
                        child: Text('Konten untuk Minggu'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: BerlanggananPage(),
          ),
          Container(
            child: ProfilePage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sell_outlined), label: 'Berlangganan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_sharp), label: 'Profile'),
        ],
        currentIndex: _selectedButtomIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

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

  Widget buildTabButton(int index, DateTime tabDate) {
    final List<String> dayNames = [
      'Sen',
      'Sel',
      'Rab',
      'Kam',
      'Jum',
      'Sab',
      'Min'
    ];
    final String dayName = dayNames[tabDate.weekday - 1];

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Mengubah indeks tab yang dipilih
          });
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
          child: Container(
            width:
                50.0, // Atur lebar sesuai keinginan Anda untuk membuatnya bulat
            height:
                50.0, // Atur tinggi sesuai keinginan Anda untuk membuatnya bulat
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Mengatur bentuk lingkaran
              color: index == _selectedIndex
                  ? Colors.green
                  : Colors.grey, // Warna latar belakang tombol
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                        color: Colors.white, // Warna teks
                        fontSize: 10),
                  ),
                  Text(
                    '${tabDate.day}',
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
