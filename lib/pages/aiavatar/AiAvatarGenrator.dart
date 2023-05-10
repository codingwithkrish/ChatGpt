import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:chatgpt/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/AiAvatarGenerator.dart';
import '../../widgets/Widgethelper1.dart';

class AiAvatarGenrator extends StatefulWidget {
  const AiAvatarGenrator({super.key});

  @override
  State<AiAvatarGenrator> createState() => _AiAvatarGenratorState();
}

class _AiAvatarGenratorState extends State<AiAvatarGenrator> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiAvatarGeneratorControler>(
        init: AiAvatarGeneratorControler(),
        builder: (controller) {
          List<Step> steps = [
            Step(
              title: Text(
                'Upload\nYour\nImages',
                textAlign: TextAlign.center,
              ),
              content: Container(),
              isActive: controller.currentstep >= 0,
            ),
            Step(
              title: Text(
                'Get\n Your\nAvatar',
                textAlign: TextAlign.center,
              ),
              content: Container(),
              isActive: controller.currentstep >= 1,
            ),
            Step(
              title: Text('Generate\nCaricature', textAlign: TextAlign.center),
              content: Container(),
              state: StepState.complete,
              isActive: controller.currentstep >= 2,
            ),
          ];
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  "AI Avatar Genrator",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            body: ListView(
              children: [
                Container(
                  height: 80.h,
                  alignment: Alignment.center,
                  child: Stepper(
                    physics: ClampingScrollPhysics(),
                    steps: steps,
                    type: StepperType.horizontal,
                    currentStep: controller.currentstep,
                  ),
                ),
                sizedBoxheight5,
                controller.pickimaged == false &&
                        controller.currentstep == 0 &&
                        controller.isuploading == false
                    ? GestureDetector(
                        onTap: () {
                          showdialog(context, controller);
                        },
                        child: Lottie.asset("assets/lottie/uploadimage.json",
                            width: 100.w, height: 200.h),
                      )
                    : controller.currentstep == 0 &&
                            controller.isuploading == false
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15.h.w),
                            child: Image.file(
                              controller.imagepath!,
                              width: 100.w,
                              height: 150.h,
                            ),
                          )
                        : Container(),
                sizedBoxheight14,
                controller.currentstep == 0 && controller.isuploading == false
                    ? GestureDetector(
                        onTap: () {
                          if (controller.pickimaged) {
                            controller.uploadimage();
                          } else {
                            showdialog(context, controller);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(5.w.h),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Text(
                            "Upload",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      )
                    : Container(),
                controller.isuploading == true
                    ? LottieBuilder.asset("assets/lottie/IMAGEUPLOAD.json")
                    : Container(),
                controller.currentstep == 1 &&
                        controller.imageurl.isNotEmpty &&
                        controller.isdownloding == false
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.w.h)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.h.w),
                                child: Image.network(controller.imageurl)),
                          ),
                          sizedBoxheight20,
                          GestureDetector(
                            onTap: () {
                              controller.downloadimage(controller.imageurl);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5.w.h),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Text(
                                "Download",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                          ),
                          sizedBoxheight20,
                          GestureDetector(
                            onTap: () {
                              controller.genratecaricature(
                                  controller.avatarid, controller.gender);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5.w.h),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Text(
                                "Genrate Caricature Avatar",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                Visibility(
                    visible: controller.isdownloding == true &&
                        controller.currentstep == 1,
                    child: Lottie.network(
                        "https://assets8.lottiefiles.com/private_files/lf30_37Dhw7.json")),
                Visibility(
                    visible: controller.iscaricature == true,
                    child: Lottie.asset("assets/lottie/ai.json")),
                controller.currentstep == 2 &&
                        controller.caricatureUrl.isNotEmpty &&
                        controller.isdownloding == false
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(25.w.h)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.h.w),
                                child: Image.network(controller.caricatureUrl)),
                          ),
                          sizedBoxheight20,
                          GestureDetector(
                            onTap: () {
                              controller
                                  .downloadimage(controller.caricatureUrl);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5.w.h),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Text(
                                "Download",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                          ),
                          sizedBoxheight20,
                        ],
                      )
                    : Container()
              ],
            ),
          );
        });
  }
}
