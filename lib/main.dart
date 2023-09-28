import 'package:cateringapp/screen/FirstPage.dart';
import 'package:cateringapp/screen/LupaKataSandi.dart';
import 'package:flutter/material.dart';
import 'screen/LoginPage.dart';
import 'screen/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: FirstPage()),
    );
  }
}
