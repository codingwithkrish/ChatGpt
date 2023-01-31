import 'package:chatgpt/constant/utils/Color.dart';
import 'package:chatgpt/controller/AuthenticationController.dart';
import 'package:chatgpt/pages/Authentication/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  sizedBoxheight20,
                  simplText("Sign up"),
                  sizedBoxheight20,
                  loginUppertxt("Sign up with one of the following options. "),
                  sizedBoxheight14,
                  googleLogo(),
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
                  LoginButton("Create Account"),
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
                              color: textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
          );
        });
  }
}