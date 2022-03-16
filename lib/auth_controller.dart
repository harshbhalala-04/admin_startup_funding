// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  final isLoading = false.obs;
  final isLogin = true.obs;
  final userEmailId = ''.obs;
  final loginState = false.obs;

  final resetPass = false.obs;
  final isConfirm = false.obs;

  String? get user => firebaseUser.value?.email;

  final isPassVisible = true.obs;
  final isRePassVisible = true.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  sendPasswordRequest(email) async {
    await _auth.sendPasswordResetEmail(email: email).then((val) {
      Get.snackbar("Password Reset Email link has been sent", "");
    }).catchError((onError) {
      Get.snackbar("Error in email sent", onError.message);
    });
    resetPass.value = false;
    isLogin.value = true;
  }

  void toggleLoginStatus() {
    isLogin.toggle();
  }

  void toggolePasswordVisibility() {
    isPassVisible.toggle();
  }

  void toggoleRePasswordVisibility() {
    isRePassVisible.toggle();
  }

  void toggoleConfrimSwitch() {
    isConfirm.toggle();
  }

  void login(String? email, String? password) async {
    isLoading.toggle();
    int temp = 0;
    try {
      await FirebaseFirestore.instance
          .collection("Admin")
          .doc("5zYpt0RJ6MhLeL6yQyYuKzPFk1V2")
          .get()
          .then((value) {
        if (value.data()!['email'] != email ||
            value.data()!['password'] != password) {
          Get.snackbar(
              "Invalid Credentials", "Please provide valid credentials",
              snackPosition: SnackPosition.BOTTOM);
          return;
        } else {
          temp = 1;
        }
      });
      if (temp == 1) {
        await _auth.signInWithEmailAndPassword(
            email: email!, password: password!);
        userEmailId.value = email;
      }
    } on FirebaseAuthException catch (error) {
      print(error);
      Get.snackbar("Error Logging in ", error.message!,
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.toggle();
  }
}

mixin FirebaseUser {}
