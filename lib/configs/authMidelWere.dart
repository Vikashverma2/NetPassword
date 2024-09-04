import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final auth = FirebaseAuth.instance;
    final isLogin = auth.currentUser != null;

    if (!isLogin && route != '/auth') {
      return const RouteSettings(name: '/auth');
    }
    return null;
  }
}
