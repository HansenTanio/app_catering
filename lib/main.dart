import 'package:cateringapp/frontend/InitialScreen/SplashPage.dart';
import 'package:cateringapp/frontend/initialScreen/LupaKataSandi.dart';
import 'package:cateringapp/frontend/initialScreen/LupaKataSandi2.dart';
import 'package:cateringapp/frontend/initialScreen/LupaKataSandi3.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: LupaKataSandi(),
    );
  }
}
