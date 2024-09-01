import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/models/credential.dart';
import 'package:uuid/uuid.dart';

import '../actions/encrpytionAndDecryption.dart';

class PasswordController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final uuid = Uuid();
  RxBool isLoading = false.obs;
  RxString errorText = "".obs;
  Future<bool> createNewCredential(
    String address,
    String title,
    String userName,
    String password,
    String siteLogo,
    String passwordStrength,
  ) async {
    isLoading.value = true;
    var id = uuid.v4();

    try {
      if (address.isNotEmpty &&
          title.isNotEmpty &&
          userName.isNotEmpty &&
          password.isNotEmpty) {
        // Create a new Credential instance
        Credential newCredential = Credential(
          id: id,
          address: address,
          title: title,
          userName: userName,
          passwordStrength: passwordStrength,
          hasPassword: encryptPassword(password),
          isLeaked: false,
          createdAt: DateTime.now().toUtc().toString(),
          siteLogo: siteLogo,
        );
        // Save to Firestore
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .collection("credentials")
            .doc(id)
            .set(newCredential.toJson());
        print("Password added successfully");
        return true;
      } else {
        // Handle case where required fields are empty
        print("One or more fields are empty");
        return false;
      }
    } catch (e) {
      // Handle and log the error
      print("Error adding password: $e");
      return false;
    } finally {
      // Ensure loading state is reset
      isLoading.value = false;
    }
  }
}
