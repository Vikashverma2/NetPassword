import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/themes.dart';
import 'package:passwordmanager/pages/auth/authPage.dart';
import 'package:passwordmanager/pages/homePage/homePage.dart';
<<<<<<< HEAD
import 'package:passwordmanager/pages/splacePage/splacePage.dart';
=======
import 'package:passwordmanager/providers/authProvider.dart';
import 'package:provider/provider.dart';
>>>>>>> c9c5f57dc117345831fecde4ca1a80de3ce7cb89

import 'configs/pageRoutes.dart';
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
<<<<<<< HEAD
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      home: SplacePage(),
=======
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Password Manager',
        theme: lightTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
>>>>>>> c9c5f57dc117345831fecde4ca1a80de3ce7cb89
    );
  }
}
