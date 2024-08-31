import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/configs/themes.dart';
import 'package:passwordmanager/pages/homePage/homePage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      home: const Homepage(),
    );
  }
}
