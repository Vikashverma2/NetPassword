import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/pages/addNewPassword/addNewPassword.dart';
import 'package:passwordmanager/demo/demoPage.dart';
import 'package:passwordmanager/pages/splacePage/splacePage.dart';

import '../pages/auth/authPage.dart';
import '../pages/homePage/homePage.dart';

var pages = [
  GetPage(
    name: "/",
    page: () => SplacePage(),
  ),
  GetPage(
    name: "/home",
    page: () => Homepage(),
  ),
  GetPage(
    name: "/auth",
    page: () => AuthPage(),
  ),
  GetPage(
    name: "/demo",
    page: () => DemoPage(),
  ),
  GetPage(
    name: "/addnewpassword",
    page: () => AddNewPasswordPage(),
  ),
];
