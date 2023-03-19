import 'dart:io';

import 'package:chatgpt/pages/Authentication/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../services/SharedPrefences.dart';

class SettingController extends GetxController {
  String? email;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SettingController() {}
  logout() async {
    await _auth.signOut();
    await SharedPreference().logout();
    _deleteAppDir();
    _deleteCacheDir();
    Get.offAll(Login());
  }

  Future<void> _deleteCacheDir() async {
    Directory tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }

  Widget getuseremail() {
    FutureBuilder(
      future: SharedPreference().getuseremail(),
      builder: (context, snapshot) {
        return ListTile(
          title: Text(
            "Email ",
          ),
          subtitle: Text(snapshot.data.toString()),
        );
      },
    );
    return Container();
  }
}
