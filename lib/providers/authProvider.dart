import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/pageRoutes.dart';

class AuthProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  RxBool isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    notifyListeners();
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
        context.go("/home");
      } else {
        print('Login canceled');
      }
    } catch (error) {
      print('Login error: $error');
    } finally {
      isLoading.value = false;
      notifyListeners(); // Notify listeners of state change
    }
  }
}
