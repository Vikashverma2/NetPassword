import 'package:get/get.dart';
import 'package:passwordmanager/configs/authMidelWere.dart';
import 'package:passwordmanager/demo/demoPage.dart';
import 'package:passwordmanager/pages/addNewPassword/addNewPassword.dart';
import 'package:passwordmanager/pages/auth/authPage.dart';
import 'package:passwordmanager/pages/homePage/homePage.dart';

import '../pages/splacePage/splacePage.dart';

var pages = [
  GetPage(
    name: "/",
    page: () => SplacePage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/home",
    page: () => Homepage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    
    name: "/auth",
    page: () => AuthPage(),
  ),
  GetPage(

    name: "/demo",
    page: () => DemoPage(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/addnewpassword",
    page: () => AddNewPasswordPage(),
    middlewares: [AuthMiddleware()],
  ),
];
