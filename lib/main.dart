import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_oreo/controller/item_count_controller.dart';
import 'package:project_oreo/controller/scan_controller.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/view/product_adding_screen/widgets/count_increment_rowCard.dart';

import 'package:project_oreo/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // var box = await Hive.openBox<>('bagBox');
  var box2 = await Hive.openBox<Product>('countBox');

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ScanController()),
          ChangeNotifierProvider(
            create: (context) => ItemCountController(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
