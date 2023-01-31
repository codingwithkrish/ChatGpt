import 'package:chatgpt/pages/Authentication/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../constant/utils/Color.dart';
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
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(children: [
                sizedBoxheight20,
                simplText("Log In"),
                sizedBoxheight20,
                loginUppertxt("Log In with one of the following options. "),
                sizedBoxheight14,
                googleLogo(),
                sizedBoxheight36,
                loginUppertxt("Email"),
                sizedBoxheight5,
                textfield(controller.emailcontroller),
                sizedBoxheight14,
                loginUppertxt("Password"),
                sizedBoxheight5,
                textfield(controller.passController),
                sizedBoxheight14,
                LoginButton("Create Account"),
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
                            color: textColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ]),
            )),
          );
        });
  }
}
