import 'package:cateringapp/frontend/initialScreen/LoginPage.dart';
import 'package:flutter/material.dart';

class LupaKataSandi3 extends StatefulWidget {
  const LupaKataSandi3({super.key});

  @override
  State<LupaKataSandi3> createState() => _LupaKataSandi3State();
}

class _LupaKataSandi3State extends State<LupaKataSandi3> {
  bool visibilityPass = false;
  bool visibilityPass2 = false;
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _passwordFocusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Lupa Kata Sandi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Email : blabla@gmail.com"),
                    Text("Berhasil terverifikasi"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Silahkan Masukkan Kata Sandi Baru Anda"),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              obscureText: !visibilityPass,
              decoration: InputDecoration(
                labelText: 'Kata Sandi Baru',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visibilityPass = !visibilityPass;
                    });
                  },
                  icon: visibilityPass
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon masukkan kata sandi';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController2,
              focusNode: _passwordFocusNode2,
              obscureText: !visibilityPass2,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Kata Sandi Baru',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visibilityPass2 = !visibilityPass2;
                    });
                  },
                  icon: visibilityPass2
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon masukkan kata sandi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50.0),
                maximumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
