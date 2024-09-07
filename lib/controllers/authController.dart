import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:passwordmanager/models/user.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> login() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        Get.rawSnackbar(
          message: 'Login successful: ${user?.displayName}',
          backgroundColor: Colors.green,
        );
        await createUser();
        Get.offAllNamed("/home");
      } else {
        Get.rawSnackbar(
          message: 'Google Sign-In canceled',
          backgroundColor: Colors.red,
        );
      }
    } catch (error) {
      Get.rawSnackbar(
        message: 'Login error: $error',
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
      Get.rawSnackbar(
        message: 'Logged out successfully',
        backgroundColor: Colors.green,
      );

      Get.offAllNamed("/auth");
    } catch (e) {
      Get.rawSnackbar(
        message: 'Logout error: $e',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> createUser() async {
    try {
      if (auth.currentUser == null) {
        throw Exception('No user is currently signed in.');
      }

      UserModel newUser = UserModel(
        id: auth.currentUser!.uid,
        name: auth.currentUser!.displayName ?? 'Unknown',
        email: auth.currentUser!.email ?? 'No email',
        profileUrl: auth.currentUser!.photoURL,
        isPasswordEnable: false,
        pin: "",
        userid: auth.currentUser!.uid,
      );

      await db.collection("users").doc(auth.currentUser!.uid).set(
            newUser.toJson(),
          );
      Get.rawSnackbar(
        message: "User successfully created",
        backgroundColor: Colors.green,
      );
    } catch (e) {
      Get.rawSnackbar(
        message: 'Error creating user: $e',
        backgroundColor: Colors.red,
      );

      // Optionally, handle specific exceptions
      if (e is FirebaseException) {
        Get.rawSnackbar(
          message: 'Firebase error: ${e.message}',
          backgroundColor: Colors.red,
        );
      } else {
        Get.rawSnackbar(
          message: 'Unexpected error: $e',
          backgroundColor: Colors.red,
        );
      }
    }
  }
}
