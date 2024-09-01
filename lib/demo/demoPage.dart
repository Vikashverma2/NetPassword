import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:passwordmanager/actions/checkPasswordLeaked.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pwd = TextEditingController();
    final encrypt.Key key = encrypt.Key.fromLength(32); // 32 bytes = 256 bits
    final encrypt.IV iv = encrypt.IV.fromLength(16); // 16 bytes = 128 bits
    final encrypt.Encrypter encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    RxString hashedPassword = "week".obs;
    RxString decryptedPassword = "".obs;
    RxBool isLeaked = false.obs;

    // Function to encrypt a password
    String encryptPassword(String password) {
      return encrypter.encrypt(password, iv: iv).base64;
    }

    // Function to decrypt a password
    String decryptPassword(String encryptedPassword) {
      return encrypter.decrypt64(encryptedPassword, iv: iv);
    }

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
            Obx(() => Text("Encrypted: ${hashedPassword.value}")),
            const SizedBox(height: 10),
            Obx(() => Text("Decrypted: ${decryptedPassword.value}")),
            PrimaryButton(
              title: "Encrypt and Decrypt",
              icon: IconsAssets.lock,
              ontap: () async {
                // Encrypt the password
                String encrypted = encryptPassword(pwd.text);
                hashedPassword.value = encrypted;

                // Decrypt the password
                String decrypted = decryptPassword(encrypted);
                decryptedPassword.value = decrypted;

                print("Encrypted: $encrypted");
                print("Decrypted: $decrypted");
              },
            ),
          ],
        ),
      ),
    );
  }
}
