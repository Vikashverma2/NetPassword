import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class SplacePage extends StatefulWidget {
  const SplacePage({super.key});

  @override
  State<SplacePage> createState() => _SplacePageState();
}

class _SplacePageState extends State<SplacePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed("/auth");
    });
  }

  @override
  Widget build(BuildContext context) {
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
