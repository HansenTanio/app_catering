import 'package:cateringapp/frontend/initialScreen/LoginPage.dart';
import 'package:cateringapp/frontend/initialScreen/RegisterPage.dart';
import 'package:cateringapp/frontend/screen/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";
  String? _usernameValue;
  String? _passwordValue;

  void _loadData() async {
    prefs = await SharedPreferences.getInstance();
    _passwordValue = prefs.getString(_keyPassword);
    _usernameValue = prefs.getString(_keyUsername);
    if (_usernameValue != null &&
        _passwordValue != null &&
        _usernameValue != '' &&
        _passwordValue != '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage(
                    'logo/logo-darkmode.png',
                  ),
                  width: 150,
                ),
                Image(
                  image: AssetImage(
                    'logo/teks-darkmode.png',
                  ),
                  width: 200,
                ),
              ],
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Selamat datang di TasteTroop!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Catering dengan makanan yang sehat.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50.0),
                          maximumSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: Text("Masuk"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50.0),
                          maximumSize: Size(
                            MediaQuery.of(context).size.width,
                            50.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                        child: Text("Daftar"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dengan login atau daftar, berarti kamu menyetujui Syarat Ketentuan dan Kebijakan Privasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
