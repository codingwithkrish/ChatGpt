import 'package:chatgpt/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget box(String text, VoidCallback onpress) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w.h),
          border: Border.all(color: greywhite)),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    ),
  );
}

Widget paymentBox(
    String text, int money, VoidCallback onpress, String wordsearch) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    decoration: BoxDecoration(
        border: Border.all(color: greywhite),
        borderRadius: BorderRadius.circular(5.w.h)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.monetization_on,
              color: primarycolor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "₹ " + money.toString() + " /month",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text("${wordsearch} words searching per month"),
        GestureDetector(
          onTap: onpress,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.circular(5.w.h)),
            child: Text(
              "Purchase This Plan",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
