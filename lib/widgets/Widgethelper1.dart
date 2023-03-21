import 'package:carousel_slider/carousel_slider.dart';

import 'package:chatgpt/controller/CodeCompletionConroller.dart';
import 'package:chatgpt/controller/HomeController.dart';
import 'package:chatgpt/pages/chatgpt/codecompletion/CodeChat.dart';
import 'package:chatgpt/pages/chatgpt/textcompletion.dart/Chat.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:chatgpt/pages/newspage.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/textCompletionController.dart';
import '../models/newsModel.dart';
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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(i.imageurl.toString())),
                      borderRadius: BorderRadius.circular(10.w.h)),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    i.tittle.toString(),
                    // style: TextStyling.style2,
                    textAlign: TextAlign.center,
                  ),
                )
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
            enabled: !change.istyping,
            style: TextStyle(),
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

Widget buildTextComposercode(CodeCompletionController change) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            enabled: !change.istyping,
            style: TextStyle(),
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
                  await change.sendmessage(CodeChat(
                    text: change.controller1.text.toString(),
                    sender: "sender",
                    codeController: codeController,
                  ));

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
          padding: EdgeInsets.all(5),
          child: Row(children: [
            Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      news[index].imageurl.toString(),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(25.w.h)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Container(
                child: Text(
                  // overflow: TextOverflow.ellipsis,
                  news[index].tittle.toString(),
                  //  style: TextStyling.style2,
                ),
              ),
            )
          ]),
        ),
      );
    },
  );
}

Widget listofchips(HomeController controller) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
        children: controller.string.map((item) {
      return Container(
        margin: EdgeInsets.all(5.h.w),
        child: ActionChip(
          backgroundColor:
              controller.domain == item ? primarycolor : Colors.grey,
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

Widget boxhome(VoidCallback ontap, String text1, String text2) {
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
                child: Icon(Icons.wifi_protected_setup)),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
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
