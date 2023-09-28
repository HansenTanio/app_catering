import 'package:cateringapp/screen/RegisterPage.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  image: AssetImage(
                    'images/logo-default.png',
                  ),
                  width: 250),
              SizedBox(
                height: 100,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: "Catering dengan makanan"),
                    TextSpan(text: " yang sehat."),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50.0),
                    maximumSize: Size(MediaQuery.of(context).size.width, 50),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Daftar Gratis")],
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: Size(200, 50.0),
                    maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.grey)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('images/google.png'),
                        width: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Lanjutkan dengan Google")
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: Size(200, 50.0),
                    maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.grey)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Lanjutkan dengan Facebook")
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
