import 'package:cateringapp/screen/LoginPage.dart';
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
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  icon: Icon(Icons.arrow_back)),
              Align(
                alignment: Alignment.centerLeft,
                child: Image(
                    image: AssetImage('assets/images/logo-darkmode.png'),
                    width: 100),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 1, 67, 121),
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
