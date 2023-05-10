import 'package:chatgpt/pages/home/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/home/MainHome.dart';
import '../services/Auth/Auth.dart';

class SignInController extends GetxController {
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool loading = true;
  SignInController();
  Future<void> signInWithGoogle() async {
    loading = false;
    update();
    await Auth().signInWithGoogle().then((value) {
      if (value == true) {
        Get.to(Home());
      }
    });
    loading = true;
    update();
  }

  SiginWithEmail() async {
    loading = false;
    update();
    if (emailcontroller.text.isNotEmpty && passController.text.isNotEmpty) {
      await Auth()
          .sigin(
              emailcontroller.text.toString(), passController.text.toString())
          .then((value) {
        if (value == true) {
          Get.offAll(Home());
        }
      });
    } else {
      Get.rawSnackbar(message: "Please Fill All the Details");
    }
    loading = true;
    update();
  }
}
