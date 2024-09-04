import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for HapticFeedback
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passwordmanager/components/localAuthKey.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/controllers/localAuthController.dart';

class LocalAuthPage extends StatelessWidget {
  const LocalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    LocalAuthController authController = Get.put(LocalAuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              IconsAssets.lock,
              width: 60,
            ),
            const SizedBox(height: 40),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: index < authController.pin.value.length
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  }),
                )),
            const SizedBox(height: 10),
            const Text("Please enter 4 digit pin"),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AuthKey(
                  text: Text(
                    "1",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("1"),
                ),
                AuthKey(
                  text: Text(
                    "2",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("2"),
                ),
                AuthKey(
                  text: Text(
                    "3",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("3"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AuthKey(
                  text: Text(
                    "4",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("4"),
                ),
                AuthKey(
                  text: Text(
                    "5",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("5"),
                ),
                AuthKey(
                  text: Text(
                    "6",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("6"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AuthKey(
                  text: Text(
                    "7",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("7"),
                ),
                AuthKey(
                  text: Text(
                    "8",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("8"),
                ),
                AuthKey(
                  text: Text(
                    "9",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("9"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AuthKey(
                  text: SvgPicture.asset(
                    IconsAssets.fingerprint,
                    width: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: w,
                  ontap: () {
                    authController.authenticateWithDevice();
                    HapticFeedback
                        .lightImpact(); // Light haptic feedback on fingerprint tap
                    // Trigger fingerprint authentication
                  },
                ),
                AuthKey(
                  text: Text(
                    "0",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => authController.addDigit("0"),
                ),
                AuthKey(
                  text: SvgPicture.asset(
                    IconsAssets.backspace,
                    width: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: w,
                  ontap: authController.deleteLastDigit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
