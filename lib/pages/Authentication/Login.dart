import 'dart:math';

import 'package:chatgpt/controller/AuthenticationController.dart';
import 'package:chatgpt/pages/Authentication/Signup.dart';
import 'package:chatgpt/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../constant/utils/spacing.dart';
import '../../widgets/Widgethelper1.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
                child: controller.loading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primarycolor,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListView(
                          children: [
                            sizedBoxheight20,
                            simplText("Sign up"),
                            sizedBoxheight20,
                            loginUppertxt(
                                "Sign up with one of the following options. "),
                            sizedBoxheight14,
                            googleLogo(() async {
                              await controller.signInWithGoogle();
                            }),
                            sizedBoxheight36,
                            loginUppertxt("Name"),
                            sizedBoxheight5,
                            textfield(controller.nameController),
                            sizedBoxheight14,
                            loginUppertxt("Email"),
                            sizedBoxheight5,
                            textfield(controller.emailController),
                            sizedBoxheight14,
                            loginUppertxt("Password"),
                            sizedBoxheight5,
                            textfield(controller.passwordController),
                            sizedBoxheight14,
                            controller.loading == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: primarycolor,
                                    ),
                                  )
                                : LoginButton("Create Account", () async {
                                    await controller.signWithEmail();
                                  }),
                            sizedBoxheight14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                loginUppertxt('Already have Account? '),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SignIn());
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.to(Scaffold(
                                    body: SafeArea(
                                      child: InAppWebView(
                                          initialUrlRequest: URLRequest(
                                              url: Uri.parse(
                                                  "https://sites.google.com/view/aicompanion-privacypolicy"))),
                                    ),
                                  ));
                                },
                                child: Text(
                                  "Privacy Policy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.to(Scaffold(
                                    body: SafeArea(
                                      child: InAppWebView(
                                          initialUrlRequest: URLRequest(
                                              url: Uri.parse(
                                                  "https://sites.google.com/view/aicompanion-termsandcondition/home"))),
                                    ),
                                  ));
                                },
                                child: Text(
                                  "Terms & Condition",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                                ))
                          ],
                        ),
                      )),
          );
        });
  }
}
