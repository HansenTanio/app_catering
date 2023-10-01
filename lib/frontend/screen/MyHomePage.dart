import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String username;
  final String password;

  const MyHomePage({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState(username, password);
}

class _MyHomePageState extends State<MyHomePage> {
  late String username;
  late String password;

  _MyHomePageState(String username, String password) {
    this.username = username;
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Text(username),
              Text(password),
              ElevatedButton(
                onPressed: () {
                  print("hello");
                },
                child: Text("Hello"),
              )
            ],
          ),
        ));
  }
}
