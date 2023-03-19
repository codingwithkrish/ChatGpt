import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color.dart';
import '../../../widgets/Widgethelper1.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.text,
    required this.sender,
  }) : super(key: key);
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sender == "sender" ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: sender == "sender"
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.all(10.w.h),
            padding: EdgeInsets.all(10.w.h),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                    color: sender == "sender" ? primarycolor : Colors.black),
                borderRadius: BorderRadius.circular(15.w.h)),
            child: Text(
              text,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
        )
      ],
    );
  }
}
