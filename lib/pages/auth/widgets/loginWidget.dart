import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/controllers/authController.dart';

import '../../../components/primaryButton.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 50),
        TextFormField(
          autofocus: false,
          controller: email,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.alternate_email),
            hintText: "Email id",
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: password,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.password),
            hintText: "Password",
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : PrimaryButton(
                      title: "Log In",
                      icon: IconsAssets.lock,
                      ontap: () {
                        // authController.loginWithEmailAndPassword(
                        //   email.text,
                        //   password.text,
                        // );
                      },
                    ),
            )
          ],
        )
      ],
    );
  }
}
