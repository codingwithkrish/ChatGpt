import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Color.dart';

ThemeData themeData() {
  return ThemeData(
      scaffoldBackgroundColor: backGroundColor,
      fontFamily: "Poppins",
      focusColor: primarycolor,
      primaryColor: primarycolor,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20.sp, color: textColor)));
}
