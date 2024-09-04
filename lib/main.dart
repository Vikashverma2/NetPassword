import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:passwordmanager/configs/themes.dart';
import 'package:window_manager/window_manager.dart';
import 'configs/pageRoutes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await windowManager.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(600, 900),
    size: Size(600, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      getPages: pages,
      // home: LocalAuthPage(),
      enableLog: true,
    );
  }
}
