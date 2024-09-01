import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

import '../../actions/passwordStrenth.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pwd = TextEditingController();
    RxString strenth = "week".obs;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: pwd,
              onChanged: (value) {
                strenth.value = checkPasswordStrength(value);
              },
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 30),
            Obx(
              () => Text(strenth.value),
            ),
            PrimaryButton(
              title: "Check",
              icon: IconsAssets.lock,
              ontap: () {
                strenth.value = checkPasswordStrength(pwd.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
