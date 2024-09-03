import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for HapticFeedback
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passwordmanager/components/localAuthKey.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class LocalAuthPage extends StatelessWidget {
  const LocalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalAuthentication _auth = LocalAuthentication();
    final w = MediaQuery.of(context).size.width;
    String existingPin = "7033";
    RxString pin = "".obs;

    void addDigit(String digit) {
      if (pin.value.length < 4) {
        // Limiting the pin to 4 digits
        pin.value += digit;
      }
      HapticFeedback.lightImpact();

      if (pin.value == existingPin) {
        print("Authenticated");
        Get.offAllNamed("/home");
      }
    }

    void deleteLastDigit() {
      if (pin.value.isNotEmpty) {
        pin.value = pin.value.substring(0, pin.value.length - 1);
      }
      HapticFeedback
          .lightImpact(); // Light haptic feedback on every button click
    }

    void authenticateWithDevice() async {
      final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
      if (canAuthenticateWithBiometrics) {
        try {
          final bool didAuthenticate = await _auth.authenticate(
            localizedReason: 'Please authenticate to show account balance',
            options: const AuthenticationOptions(
              biometricOnly: false,
              sensitiveTransaction: true,
            ),
          );
          if (didAuthenticate) {
            Get.offAllNamed("/home");
          }
        } catch (ex) {
          print(ex);
        }
      }
    }

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
            SizedBox(height: 40),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: index < pin.value.length
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  }),
                )),
            SizedBox(height: 10),
            Text("Please enter 4 digit pin"),
            SizedBox(height: 40),
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
                  ontap: () => addDigit("1"),
                ),
                AuthKey(
                  text: Text(
                    "2",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("2"),
                ),
                AuthKey(
                  text: Text(
                    "3",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("3"),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  ontap: () => addDigit("4"),
                ),
                AuthKey(
                  text: Text(
                    "5",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("5"),
                ),
                AuthKey(
                  text: Text(
                    "6",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("6"),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  ontap: () => addDigit("7"),
                ),
                AuthKey(
                  text: Text(
                    "8",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("8"),
                ),
                AuthKey(
                  text: Text(
                    "9",
                    style: TextStyle(
                      fontSize: w / 10,
                    ),
                  ),
                  width: w,
                  ontap: () => addDigit("9"),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                    authenticateWithDevice();
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
                  ontap: () => addDigit("0"),
                ),
                AuthKey(
                  text: SvgPicture.asset(
                    IconsAssets.backspace,
                    width: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: w,
                  ontap: deleteLastDigit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
