import 'package:cateringapp/backend/data/Database.dart';
import 'package:cateringapp/backend/data/Menu.dart';
// import 'package:cateringapp/frontend/widget/DialogPilihAlamat.dart';
import 'package:cateringapp/frontend/widget/KotakMenu1.dart';
import 'package:flutter/material.dart';

import '../widget/DialogPilihAlamat2.dart';
import '../widget/GambarCorusel.dart';
// import '../widget/KotakMenu1.dart';
import 'BerlanggananPage.dart';
import 'ProfilePage.dart';

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
  DBHelper _dbHelper = DBHelper();
  List<Menu> listMenu = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var tmp = await _dbHelper.getMyMenu();
    setState(() {
      listMenu = tmp;
    });
  }

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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DialogPilihAlamat2();
                }));
              },
              child: Text("Pilih Alamat"),
            ), // PEMILIHAN ALAMAT CUSTOMER.
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset('assets/logo/logo.png', width: 50),
                  Image.asset('assets/logo/teks.png', width: 80),
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
                          child: FutureBuilder(
                            future: _dbHelper.getMyMenu(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          print(snapshot.data);
                                        },
                                        child: Text("print")),
                                    Container(
                                      height: 320,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 228, 228, 228)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Menu Langganan regular : 400k",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              // child: Text("tes"),
                                              child: Row(
                                                children: List.generate(
                                                  snapshot.data!.length,
                                                  (index) => KotakMenu1(
                                                    menu: snapshot.data![index],
                                                  ),
                                                ),
                                              ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
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
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Text("Tes"),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              "Menu Langganan keluarga : 1.2jt",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Text("Tes"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Text('Data not available');
                              }
                            },
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
