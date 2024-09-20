import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_oreo/view/history_screen/history_screen.dart';
import 'package:project_oreo/view/product_adding_screen/product_adding_screen.dart';
import 'package:project_oreo/view/splash_screen/splash_screen.dart';

Future<void> main(List<String> args) async {
  runApp(MyApp());
  Hive.initFlutter();
  var box = await Hive.openBox('productBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductAddingScreen(),
    );
  }
}
