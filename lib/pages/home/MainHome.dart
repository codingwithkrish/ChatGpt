import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controller/HomeController.dart';
import '../../widgets/Widgethelper1.dart';
import '../chatgpt/codecompletion/CodeMessage.dart';
import '../chatgpt/imagegenration/imagegenration.dart';
import '../chatgpt/textcompletion.dart/TextCompletion.dart';
import '../settings/settings.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("ChatGpt"),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    Get.to(Settings());
                  },
                  child: Icon(Icons.manage_accounts)),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    sizedBoxheight14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: container1("AI Image Generation",
                              "assets/images/gallery.png", () {
                            Get.to(const ImageGenration());
                          }),
                        ),
                        Expanded(
                            flex: 1,
                            child: container1(
                                "Text Completion", "assets/images/edit.png",
                                () {
                              Get.to(TextCompletion());
                            }))
                      ],
                    ),
                    sizedBoxheight14,
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: container1(
                              "Code Completion", "assets/images/code.png", () {
                            Get.to(CodeMessage(
                              name: "EXplain Code",
                              i: 0,
                            ));
                          }),
                        ),
                        Expanded(
                          flex: 1,
                          child: container1("Object Detection",
                              "assets/images/code.png", () {}),
                        ),
                      ],
                    ),
                    sizedBoxheight20,
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Let's See What's Happening in society.....",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    sizedBoxheight20,
                    carsoulSlider(controller.newsmodel),
                    sizedBoxheight14,
                    //  listofchips(controller),
                    sizedBoxheight14,
                    controller.isloading
                        ? CircularProgressIndicator()
                        : listofnews(controller.newsmodel1)
                  ],
                ),
              ),
            )),
          );
        });
  }
}
