import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class Apptheme {
  static final ThemeData lighttheme = ThemeData(
      scaffoldBackgroundColor: backgroundlight,
      fontFamily: "Poppins",
      appBarTheme: const AppBarTheme(
          backgroundColor: backgroundlight,
          iconTheme: IconThemeData(color: lighttextcolor),
          titleTextStyle: TextStyle(color: lighttextcolor, fontSize: 20)),
      colorScheme: const ColorScheme.light(
          primary: primarycolor, onPrimary: otherprimarycolor),
      textTheme: TextTheme(
          titleLarge: TextStyle(color: lighttextcolor, fontSize: 20.sp)));
  static final ThemeData darktheme = ThemeData(
      fontFamily: "Poppins",
      scaffoldBackgroundColor: backgrounddark,
      appBarTheme: const AppBarTheme(
          // color: primarycolor,
          backgroundColor: Colors.grey,
          iconTheme: IconThemeData(color: lighttextcolor),
          titleTextStyle: TextStyle(color: lighttextcolor, fontSize: 20)),
      colorScheme: const ColorScheme.dark(
          primary: primarycolor, onPrimary: otherprimarycolor),
      textTheme: TextTheme(
          titleLarge: TextStyle(color: lighttextcolor, fontSize: 20.sp)));
}
