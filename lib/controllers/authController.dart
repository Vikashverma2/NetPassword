import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  static const _clientId =
      "1944382428-58l2pdnrk6941an3kk5k4068dch8sjdm.apps.googleusercontent.com"; // replace with your client ID
  static const _scopes = [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ];

  Future<void> login() async {
    isLoading.value = true;
    try {
      final client = await _getClient();

      if (client != null) {
        final idToken = client.credentials.idToken;
        final accessToken = client.credentials.accessToken.data;
        final credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
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

  Future<AutoRefreshingAuthClient?> _getClient() async {
    try {
      var client = await clientViaUserConsent(
        ClientId(_clientId, ""),
        _scopes,
        (url) {
          // Open the authorization URL in the browser
          print("Please go to the following URL and grant access:");
          print("  => $url");
        },
      );
      return client;
    } catch (e) {
      print("Error during login: $e");
      return null;
    }
  }
}
