import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:passwordmanager/actions/checkPasswordLeaked.dart';
import 'package:passwordmanager/actions/encrpytionAndDecryption.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pwd = TextEditingController();

    RxString hashedPassword = "week".obs;
    RxString decryptedPasswordText = "".obs;
    RxString encryptedPasswordText = "".obs;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: pwd,
              decoration: const InputDecoration(
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(height: 30),
            Obx(() => Text("Encrypted: ${encryptedPasswordText.value}")),
            const SizedBox(height: 10),
            Obx(() => Text("Decrypted: ${decryptedPasswordText.value}")),
            PrimaryButton(
              title: "Encrypt and Decrypt",
              icon: IconsAssets.lock,
              ontap: () async {
                encryptedPasswordText.value = encryptPassword(pwd.text);
                decryptedPasswordText.value =
                    decryptPassword(encryptedPasswordText.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
