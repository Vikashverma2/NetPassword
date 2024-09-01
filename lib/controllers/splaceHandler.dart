import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplaceHandler extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    handleSplace();
    super.onInit();
  }

  Future<void> handleSplace() async {
    Future.delayed(Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAllNamed("/home");
      } else {
        Get.offAllNamed("/auth");
      }
    });
  }
}
