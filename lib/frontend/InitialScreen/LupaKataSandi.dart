import 'package:flutter/material.dart';
import 'LupaKataSandi2.dart';

class LupaKataSandi extends StatefulWidget {
  const LupaKataSandi({super.key});

  @override
  State<LupaKataSandi> createState() => _LupaKataSandiState();
}

class _LupaKataSandiState extends State<LupaKataSandi> {
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
              "Masukkan Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(
                  Icons.email,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LupaKataSandi2();
                }));
              },
              child: Text('Lanjut'),
            ),
          ],
        ),
      ),
    );
  }
}
