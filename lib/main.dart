import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'models/state_model.dart';
import 'package:provider/provider.dart';
import '/splash_screen.dart';
import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Posttest 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: ((context) => AppStateModel()..loadProducts()),
      child: const MyApp(),
    ),
  );
}