import 'package:chatgpt/pages/home/Home.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:chatgpt/services/Auth/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool loading = false;
  AuthController();

  Future<void> signInWithGoogle() async {
    loading = true;

    update();
    await Auth().signInWithGoogle().then((value) {
      if (value == true) {
        Get.to(() => Home());
      }
    });
    loading = false;
    update();
  }

  Future<void> signWithEmail() async {
    loading = true;
    update();
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      await Auth()
          .signWithemail(
              nameController.text.toString(),
              emailController.text.toString(),
              passwordController.text.toString())
          .then((value) {
        if (value == true) {
          Get.offAll(Home());
        }
      });
    } else {
      Get.rawSnackbar(message: "Please Fill All the Details");
    }

    loading = false;
    update();
  }
}
