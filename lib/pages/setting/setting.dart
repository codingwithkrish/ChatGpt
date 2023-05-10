import 'package:chatgpt/pages/setting/settingwidget.dart';
import 'package:chatgpt/services/SharedPrefences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../controller/settingController.dart';
import '../payments/payment.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text("Setting's"),
            ),
            body: SafeArea(
                child: ListView(
              children: [
                box("Terms & Condition", () {
                  Get.to(Scaffold(
                    body: SafeArea(
                      child: InAppWebView(
                          initialUrlRequest: URLRequest(
                              url: Uri.parse(
                                  "https://sites.google.com/view/aicompanion-termsandcondition/home"))),
                    ),
                  ));
                }),
                box("Privacy Policy", () {
                  Get.to(Scaffold(
                    body: SafeArea(
                      child: InAppWebView(
                          initialUrlRequest: URLRequest(
                              url: Uri.parse(
                                  "https://sites.google.com/view/aicompanion-privacypolicy"))),
                    ),
                  ));
                }),
                box("Plans and Billings", () async {
                  String name =
                      await SharedPreference().getusername().toString();
                  String email =
                      await SharedPreference().getuseremail().toString();
                  Get.to(() => Payment(
                        email: email,
                        name: name,
                      ));
                }),
                box("Log Out", () {
                  context.logout();
                })
              ],
            )),
          );
        });
  }
}
