import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();

  String existingPin = "7033";
  RxString pin = "".obs;



  void addDigit(String digit) {
    if (pin.value.length < 4) {
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
    HapticFeedback.lightImpact(); // Light haptic feedback on every button click
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
}
