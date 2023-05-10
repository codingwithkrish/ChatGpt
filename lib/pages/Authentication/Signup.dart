import 'package:chatgpt/pages/Authentication/Login.dart';
import 'package:chatgpt/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../constant/utils/spacing.dart';
import '../../controller/SignIn.dart';
import '../../widgets/Widgethelper1.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Scaffold(
            body: controller.loading == false
                ? Center(
                    child: CircularProgressIndicator(
                      color: primarycolor,
                    ),
                  )
                : SafeArea(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ListView(children: [
                      sizedBoxheight20,
                      simplText("Log In"),
                      sizedBoxheight20,
                      loginUppertxt(
                          "Log In with one of the following options. "),
                      sizedBoxheight14,
                      googleLogo(() async {
                        await controller.signInWithGoogle();
                      }),
                      sizedBoxheight36,
                      loginUppertxt("Email"),
                      sizedBoxheight5,
                      textfield(controller.emailcontroller),
                      sizedBoxheight14,
                      loginUppertxt("Password"),
                      sizedBoxheight5,
                      textfield(controller.passController),
                      sizedBoxheight14,
                      controller.loading == false
                          ? Center(child: CircularProgressIndicator())
                          : LoginButton("Log In", () async {
                              await controller.SiginWithEmail();
                            }),
                      sizedBoxheight14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          loginUppertxt('Dont have Account? '),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(Login());
                            },
                            child: Text(
                              "Sign Up",
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
                    ]),
                  )),
          );
        });
  }
}
