import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SupportController extends GetxController {
  bool issending = false;
  TextEditingController subjectController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();
  SupportController();

  Future<bool> sendEmail() async {
    issending = true;
    update();
    if (bodyController.text.isNotEmpty && subjectController.text.isNotEmpty) {
      final Email email = Email(
        body: bodyController.text.toString(),
        subject: subjectController.text.toString(),
        recipients: ['krish@krishgupta.com'],
        cc: ['krish@krishgupta.com'],
        bcc: ['krish@krishgupta.com'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email).then((value) {
        issending = false;
        bodyController.clear();
        subjectController.clear();

        update();
        return true;
      });
      return false;
    } else {
      Get.rawSnackbar(
          title: "No Subject or Body",
          message: "Please Enter Subject and Body");
      issending = false;
      bodyController.clear();
      subjectController.clear();
      update();
      return false;
    }
  }
}
