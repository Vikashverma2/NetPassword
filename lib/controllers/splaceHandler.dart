import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceHandler extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    handleSplace();
    super.onInit();
  }

  Future<void> handleSplace() async {
    Future.delayed(const Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAllNamed("/local-auth");
      } else {
        Get.offAllNamed("/auth");
      }
    });
  }
}
