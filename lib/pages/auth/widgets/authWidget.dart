import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/pages/auth/widgets/signupWidget.dart';

import 'loginWidget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              // color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AnimationAssets.lockAuth, width: 300),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        "Trusted and secure",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Your passwords are protected with high-level security",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Obx(() => InkWell(
                            onTap: () {
                              isLogin.value = true;
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Easing.legacyAccelerate,
                              height: 50,
                              decoration: BoxDecoration(
                                color: isLogin.value
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Login",
                                      style: TextStyle(
                                          color: isLogin.value
                                              ? Colors.white
                                              : Colors.grey)),
                                ],
                              ),
                            ),
                          ))),
                  Expanded(
                    child: Obx(
                      () => InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Easing.legacyAccelerate,
                          height: 50,
                          decoration: BoxDecoration(
                              color: isLogin.value
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.primary),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Signup",
                                style: TextStyle(
                                    color: isLogin.value
                                        ? Colors.grey
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => isLogin.value ? SignInWidget() : SignUpWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
