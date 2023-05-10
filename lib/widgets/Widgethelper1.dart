import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatgpt/controller/AllNews.controller.dart';
import 'package:path/path.dart' as path;

import 'package:chatgpt/controller/CodeCompletionConroller.dart';
import 'package:chatgpt/controller/HomeController.dart';
import 'package:chatgpt/pages/chatgpt/codecompletion/CodeChat.dart';
import 'package:chatgpt/pages/chatgpt/textcompletion.dart/Chat.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:chatgpt/pages/newspage.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progressive_image/progressive_image.dart';
import '../controller/AiAvatarGenerator.dart';
import '../controller/textCompletionController.dart';
import '../main.dart';
import '../models/newsModel.dart';
import '../pages/camera/cameraMain.dart';
import '../utils/color.dart';

Widget simplText(String text) {
  return Text(
    text,
    // style: TextStyling.style1,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
  );
}

Widget loginUppertxt(String text) {
  return Text(
    text,
    // style: TextStyling.style2,
    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
  );
}

Widget googleLogo(VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: greywhite,
          borderRadius: BorderRadius.circular(10.w.h),
          border: Border.all(color: Colors.black)),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Icon(
        Icons.g_mobiledata_rounded,
        color: primarycolor,
        size: 35.h,
      ),
    ),
  );
}

Widget textfield(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: primarycolor,
    // style: TextStyling.style2,
    decoration: InputDecoration(
        fillColor: primarycolor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greywhite),
        ),
        hoverColor: greywhite,
        focusColor: greywhite,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderSide: BorderSide(color: greywhite))),
  );
}

Widget textfieldSupport(TextEditingController controller, int maxline) {
  return TextFormField(
    controller: controller,

    maxLines: maxline,
    keyboardType: TextInputType.multiline,
    cursorColor: primarycolor,
    // style: TextStyling.style2,
    decoration: InputDecoration(
        fillColor: primarycolor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greywhite),
        ),
        hoverColor: greywhite,
        focusColor: greywhite,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderSide: BorderSide(color: greywhite))),
  );
}

Widget textfieldNews(
    TextEditingController controller, AllNewsController newsController) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,

    onFieldSubmitted: (value) {
      newsController.getnewsbysearch();
    },
    cursorColor: primarycolor,
    // style: TextStyling.style2,
    decoration: InputDecoration(
        fillColor: primarycolor,
        hintText: "Search Your News...........",
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15.w.h)),
        hoverColor: greywhite,
        focusColor: greywhite,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15.w.h)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15.w.h))),
  );
}

Widget LoginButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: greywhite, borderRadius: BorderRadius.circular(10.w.h)),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        //     style: TextStyling.style2.copyWith(fontSize: 20.sp),
      ),
    ),
  );
}

Widget container1(String text, String path, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      height: 150.h,
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            path,
            width: 80.w,
            height: 80.h,
          ),
          Text(
            text,
            //style: TextStyling.style2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: BorderRadius.circular(10.w.h),
          border: Border.all(color: Colors.black)),
    ),
  );
}

Widget carsoulSlider(List<NewsModel> news) {
  return CarouselSlider(
    options: CarouselOptions(
        height: 180.h,
        enableInfiniteScroll: true,
        autoPlay: true,
        enlargeCenterPage: true),
    items: news.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Get.to(NewsPage(model: i));
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.w.h),
                      child: ProgressiveImage(
                        height: 180.h,
                        image: NetworkImage(i.imageurl.toString()),
                        placeholder: AssetImage("assets/images/gallery.png"),
                        thumbnail: AssetImage("assets/images/code.png"),
                        width: MediaQuery.of(context).size.width,
                      )),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.6),
                      // image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: NetworkImage(
                      //       i.imageurl.toString(),
                      //     )),
                      borderRadius: BorderRadius.circular(
                        10.w.h,
                      )),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.h),
                      height: 70.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.w.h),
                            bottomRight: Radius.circular(10.w.h),
                          ),
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black87,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                i.tittle.toString(),
                                style: TextStyle(
                                    color: backgroundlight,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ))),
                    )),
              ],
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget buildTextComposer(TextCompletionController change) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: 2,
            minLines: 1,
            enabled: !change.istyping,
            style: TextStyle(),
            textInputAction: TextInputAction.newline,
            controller: change.controller1,
            decoration: InputDecoration(
                hintText: "Question/description",
                hintStyle: TextStyle(),
                fillColor: primarycolor,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h)),
                hoverColor: primarycolor,
                focusColor: primarycolor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h))),
          ),
        ),
        Visibility(
          visible: !change.istyping,
          child: ButtonBar(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.send,
                  //  color: textColor,
                ),
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await change.sendmessage(Chat(
                      text: change.controller1.text.toString(),
                      sender: "sender"));

                  final position =
                      change.scrollController.position.maxScrollExtent;
                  change.scrollController.jumpTo(position);

                  change.update();
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildTextComposercode(CodeCompletionController change, int i) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            enabled: !change.istyping,
            style: TextStyle(),
            textInputAction: TextInputAction.newline,
            controller: change.controller1,
            decoration: InputDecoration(
                hintText: "Question/description",
                hintStyle: TextStyle(),
                fillColor: primarycolor,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h)),
                hoverColor: primarycolor,
                focusColor: primarycolor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                    borderRadius: BorderRadius.circular(40.w.h))),
          ),
        ),
        Visibility(
          visible: !change.istyping,
          child: ButtonBar(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.send,
                  //   color: textColor,
                ),
                onPressed: () async {
                  CodeController codeController = new CodeController(
                    text: change.controller1.text.toString(),
                    patternMap: {
                      r"\B#[a-zA-Z0-9]+\b": TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purpleAccent),
                    },
                  );
                  FocusManager.instance.primaryFocus?.unfocus();
                  await change.sendmessage(
                      CodeChat(
                        text: change.controller1.text.toString(),
                        sender: "sender",
                        i: i,
                        codeController: codeController,
                      ),
                      i);

                  final position =
                      change.scrollController.position.maxScrollExtent;
                  change.scrollController.jumpTo(position);

                  change.update();
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget listofnews(List<NewsModel> news) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: news.length,
    itemBuilder: (context, index) {
      if (index % 5 == 0) {
        return GestureDetector(
          onTap: () {
            Get.to(NewsPage(model: news[index]));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.w.h)),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.w.h),
                        child: ProgressiveImage(
                          height: 200.h,
                          image: NetworkImage(news[index].imageurl.toString()),
                          placeholder: AssetImage("assets/images/gallery.png"),
                          thumbnail: AssetImage("assets/images/code.png"),
                          width: MediaQuery.of(context).size.width,
                        )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.6),
                        // image: DecorationImage(
                        //   fit: BoxFit.fill,
                        //   image: NetworkImage(
                        //     news[index].imageurl.toString(),
                        //   ),
                        // ),
                        borderRadius: BorderRadius.circular(10.w.h)),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.w.h),
                              bottomRight: Radius.circular(10.w.h),
                            ),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black87,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  news[index].tittle.toString(),
                                  style: TextStyle(
                                      color: backgroundlight,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ))),
                      )),
                ],
              )),
        );
      } else {
        return GestureDetector(
          onTap: () {
            Get.to(NewsPage(model: news[index]));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                border: Border.all(color: Colors.black, width: 0.6),
                borderRadius: BorderRadius.circular(10.w.h)),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.w,
                    height: 120.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.w.h),
                        child: ProgressiveImage(
                          height: 120.h,
                          image: NetworkImage(news[index].imageurl.toString()),
                          placeholder: AssetImage("assets/images/gallery.png"),
                          thumbnail: AssetImage("assets/images/code.png"),
                          width: 120.w,
                        )),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.6),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            news[index].imageurl.toString(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.w.h)),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        // overflow: TextOverflow.ellipsis,
                        news[index].tittle.toString(),
                        style: TextStyle(
                            color: backgroundlight,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                        //  style: TextStyling.style2,
                      ),
                    ),
                  )
                ]),
          ),
        );
      }
    },
  );
}

Widget listofchips(AllNewsController controller) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        children: controller.string.map((item) {
      return Container(
        margin: EdgeInsets.all(5.h.w),
        child: ActionChip(
          backgroundColor: controller.domain == item ? primarycolor : greywhite,
          label: Text(item),
          padding: EdgeInsets.all(5.h.w),
          onPressed: () {
            controller.domain = item;
            controller.update();
            controller.getnewsbycategory();
          },
        ),
      );
    }).toList()),
  );
}

Widget tokenContainer() {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w.h), color: primarycolor),
      alignment: Alignment.center,
      child: Text(
        "10 Token left",
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ));
}

Widget boxhome(VoidCallback ontap, String text1, String text2, IconData icons) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.w.h)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(20.w.h)),
                child: Icon(icons)),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: lighttextcolor),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      text2,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                          color: lighttextcolor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

ListTileE(IconData icos, String text, VoidCallback ontap) {
  return ListTile(
    leading: Icon(icos),
    title: Text(text),
    onTap: ontap,
  );
}

showdialog(BuildContext context, AiAvatarGeneratorControler controler) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Column(
          children: <Widget>[
            Text("Image Selection"),
            Icon(
              Icons.image,
              color: Colors.red,
            ),
          ],
        ),
        content: new Text("Please Select One Process to Continue"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Upload with Camera",
            ),
            onPressed: () async {
              String? result = await Get.to(() => CameraMain(
                    camera: cameras.first,
                  ));
              print("Krish" + result.toString());
              if (result!.isNotEmpty) {
                final extension = path.extension(result);
                if (extension.toLowerCase() == ".png" ||
                    extension.toLowerCase() == ".jpg") {
                  controler.pickimaged = true;
                  controler.imagepath = File(result);
                  controler.update();
                  Get.back();
                } else {
                  showimagenotformat(context);
                }
                controler.imageurl = result;
                controler.update();
              }
            },
          ),
          CupertinoDialogAction(
            child: Text("Upload With Gallery"),
            onPressed: () {
              controler.pickimage(context);
            },
          ),
          CupertinoDialogAction(
            child: Text("Cancel"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}

showimagenotformat(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Column(
          children: <Widget>[
            Text("Image Format Not correct"),
            Icon(
              Icons.image,
              color: Colors.red,
            ),
          ],
        ),
        content:
            new Text("Image Format Not correct , It should be in .png or .jpg"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Ok"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
