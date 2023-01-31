import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatgpt/constant/utils/Color.dart';
import 'package:chatgpt/constant/utils/textStyles.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/utils/theames.dart';

Widget simplText(String text) {
  return Text(
    text,
    style: TextStyling.style1,
  );
}

Widget loginUppertxt(String text) {
  return Text(
    text,
    style: TextStyling.style2,
  );
}

Widget googleLogo() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.w.h),
          border: Border.all(color: textColor)),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Icon(
        Icons.g_mobiledata_rounded,
        color: Colors.white,
        size: 35.h,
      ),
    ),
  );
}

Widget textfield(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    cursorColor: primarycolor,
    style: TextStyling.style2,
    decoration: InputDecoration(
        fillColor: primarycolor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primarycolor),
        ),
        hoverColor: primarycolor,
        focusColor: primarycolor,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: textColor)),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: primarycolor))),
  );
}

Widget LoginButton(String text) {
  return GestureDetector(
    onTap: () {
      Get.to(MainHome());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primarycolor, borderRadius: BorderRadius.circular(10.w.h)),
      child: Text(
        text,
        style: TextStyling.style2.copyWith(fontSize: 20.sp),
      ),
    ),
  );
}

Widget container1() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 60.h),
    child: Text(
      "kris",
      style: TextStyling.style2,
    ),
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(10.w.h),
        border: Border.all(color: textColor)),
  );
}

Widget carsoulSlider() {
  return CarouselSlider(
    options: CarouselOptions(
        height: 180.h,
        enableInfiniteScroll: true,
        autoPlay: true,
        enlargeCenterPage: true),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: textColor),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFquUdIOtcM_jAE5BPAcBz4gY0UsdI-0XywAHim3CPKO_T-h3ZGyRrsKxaZHEb29VnP1U&usqp=CAU")),
                borderRadius: BorderRadius.circular(10.w.h)),
            child: Image.network(
                "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202105/Capture_27_1200x768.png"),
          );
        },
      );
    }).toList(),
  );
}
