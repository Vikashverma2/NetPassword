import 'package:get/get.dart';
import 'package:passwordmanager/demo/demoPage.dart';
import 'package:passwordmanager/pages/addNewPassword/addNewPassword.dart';
import 'package:passwordmanager/pages/auth/authPage.dart';
import 'package:passwordmanager/pages/homePage/homePage.dart';
import 'package:passwordmanager/pages/localAuth/localAuth.dart';
import '../pages/splacePage/splacePage.dart';

var pages = [
  GetPage(
    name: "/",
    page: () => const SplacePage(),
    // middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/home",
    page: () => const Homepage(),
    // middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/local-auth",
    page: () => const LocalAuthPage(),
    // middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/auth",
    page: () => const AuthPage(),
  ),
  GetPage(
    name: "/demo",
    page: () => const DemoPage(),
    // middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: "/addnewpassword",
    page: () => const AddNewPasswordPage(),
    // middlewares: [AuthMiddleware()],
  ),
];
