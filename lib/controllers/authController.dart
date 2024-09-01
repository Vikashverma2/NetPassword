import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential = await auth.signInWithCredential(credential);
        final user = userCredential.user;
        print('Login successful: ${user?.displayName}');
        Get.offAllNamed("/home");
      } else {
        print('Login canceled');
      }
    } catch (error) {
      print('Login error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed("/auth");
  }
}
