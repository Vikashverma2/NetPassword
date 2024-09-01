import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/controllers/authController.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AnimationAssets.lockAuth, width: 300)
                // Container(
                //   width: 250,
                //   height: 250,
                //   padding: EdgeInsets.all(50),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(80),
                //     color: Theme.of(context).colorScheme.primary,
                //   ),
                //   child: SvgPicture.asset(
                //     IconsAssets.logo,
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 70),
            Column(
              children: [
                Text(
                  "Trusted and secure",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 20),
                Text(
                  "Your passwords are protected with high-level security",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => authController.isLoading.value
                    ? CircularProgressIndicator()
                    : PrimaryButton(
                        title: "Log In",
                        icon: IconsAssets.lock,
                        ontap: () {
                          authController.login();
                        },
                      ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
