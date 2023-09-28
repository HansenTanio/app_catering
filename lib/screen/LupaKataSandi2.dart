import 'package:flutter/material.dart';

import 'LupaKataSandi3.dart';

//TAHAP VERIFIKASI EMAIL
class LupaKataSandi2 extends StatefulWidget {
  const LupaKataSandi2({super.key});

  @override
  State<LupaKataSandi2> createState() => _LupaKataSandi2State();
}

class _LupaKataSandi2State extends State<LupaKataSandi2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                  labelText: 'Kode Email',
                  icon: Icon(
                    Icons.numbers,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
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
                    return LupaKataSandi3();
                  }));
                },
                child: Text('Lanjut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
