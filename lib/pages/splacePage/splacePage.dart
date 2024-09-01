import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/controllers/splaceHandler.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceHandler splaceHandler = Get.put(SplaceHandler());
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          width: 400,
          AnimationAssets.security,
        ),
      ),
    );
  }
}
