import 'package:chatgpt/services/SharedPrefences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<bool> signInWithGoogle() async {
    print("yes");
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      // AuthCredential credential = GoogleAuthProvider.getCredential(
      //   accessToken: googleSignInAuthentication.accessToken,
      //   idToken: googleSignInAuthentication.idToken,
      // );
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential.user!.email);
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _firebaseFirestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'username': userCredential.user!.displayName.toString(),
          'email': userCredential.user!.email.toString(),
          'phone': userCredential.user!.phoneNumber,
          'phototurl': userCredential.user!.photoURL,
          'userid': userCredential.user!.uid
        });
      }

      print("token = ${userCredential.user!.uid}");
      SharedPreference().login(
          userCredential.user!.email.toString(),
          userCredential.user!.uid,
          userCredential.user!.displayName.toString(),
          userCredential.user!.photoURL.toString());
      return true;
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(message: e.message.toString());
      return false;
    }
  }

  Future<bool> signWithemail(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(name = name);
      print(userCredential.user!.email);
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _firebaseFirestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'username': name,
          'email': userCredential.user!.email.toString(),
          'phone': userCredential.user!.phoneNumber,
          'phototurl': "",
          'userid': userCredential.user!.uid
        });
      }
      SharedPreference().login(userCredential.user!.email.toString(),
          userCredential.user!.uid, name, "");

      return true;
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(message: e.message.toString());
      return false;
    }
  }

  Future<bool> sigin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      print(userCredential.user!.email);
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _firebaseFirestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'username': userCredential.user!.displayName.toString(),
          'email': userCredential.user!.email.toString(),
          'phone': userCredential.user!.phoneNumber,
          'phototurl': "",
          'userid': userCredential.user!.uid
        });
      }
      SharedPreference().login(
          userCredential.user!.email.toString(),
          userCredential.user!.uid,
          userCredential.user!.displayName.toString(),
          "");

      return true;
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(message: e.message.toString());
      return false;
    }
  }
}
