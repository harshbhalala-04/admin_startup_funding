import 'package:admin_startupfunding/admin_request_screen.dart';
import 'package:admin_startupfunding/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AdminAuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  final isLoading = false.obs;
  final userEmailId = ''.obs;
  final loginState = false.obs;
  final isPassVisible = true.obs;

  void toggolePasswordVisibility() {
    isPassVisible.toggle();
  }

  void login(String? email, String? password, String title) async {
    isLoading.toggle();
    try {
      userType = title;
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // // sharedPreferences.setBool('answers', false);
      // sharedPreferences.setString('title', title);

      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

      userEmailId.value = email;

      loginState.value = true;

      Get.to(AdminRequestScreen());
    } on FirebaseAuthException catch (error) {
      print(error);
      Get.snackbar("Error Logging in ", error.message!,
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.toggle();
  }
}
