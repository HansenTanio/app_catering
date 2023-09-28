import 'package:cateringapp/InitialScreen/SplashPage.dart';
import 'package:cateringapp/initialScreen/FirstPage.dart';
import 'package:cateringapp/initialScreen/LoginPage.dart';
import 'package:cateringapp/initialScreen/RegisterPage.dart';
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
      home: SplashScreen(),
    );
  }
}
