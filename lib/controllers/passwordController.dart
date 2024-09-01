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
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .collection("credentials")
            .doc(id)
            .set(newCredential.toJson());
        print("Password added successfully");
        return true;
      } else {
        print("One or more fields are empty");
        return false;
      }
    } catch (e) {
      print("Error adding password: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Stream<List<Credential>> getCredentialAsync() {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("credentials")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Credential.fromJson(doc.data()))
            .toList());
  }

  Future<void> deleteCredential(String id) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("credentials")
          .doc(id)
          .delete();
      Get.rawSnackbar(message: "Credential Deleted");
    } catch (ex) {
      Get.rawSnackbar(message: ex.toString());
    }
  }
}
