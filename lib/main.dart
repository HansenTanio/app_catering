import 'package:cateringapp/backend/Provider/MenuProvider.dart';
import 'package:cateringapp/frontend/InitialScreen/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await copyDatabase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: MyApp(),
    ),
  );
}

// Future<void> copyDatabase() async {
//   Directory documentsDirectory = await getApplicationDocumentsDirectory();
//   String path = join(documentsDirectory.path, "CateringApp.db");

//   // Check if the database exists in the documents directory
//   bool databaseExists = await databaseExists(path);

//   if (!databaseExists) {
//     // Copy the database from assets to the documents directory
//     ByteData data = await rootBundle.load(join("assets", "my_database.db"));
//     List<int> bytes = data.buffer.asUint8List();
//     await File(path).writeAsBytes(bytes);
//   }
// }

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
