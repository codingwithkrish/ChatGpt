import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../services/SharedPrefences.dart';
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
        Visibility(
          visible: sender != "sender",
          child: GestureDetector(
            child: Container(
              height: 25.h,
              width: 25.w,
              margin: EdgeInsets.only(
                left: 5.w,
                top: 5.h,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/gpt.png")),
                  //borderRadius: BorderRadius.circular(150.w.h),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
                left: 10.w,
                top: 10.h,
                bottom: 10.h,
                right: sender != "sender" ? 10.w : 0.w),
            padding: EdgeInsets.all(10.w.h),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                    color: sender == "sender" ? primarycolor : Colors.black),
                borderRadius: BorderRadius.only(
                    topLeft: sender == "sender"
                        ? Radius.circular(15.w.h)
                        : Radius.circular(0.w.h),
                    bottomLeft: Radius.circular(15.w.h),
                    bottomRight: Radius.circular(15.w.h),
                    topRight: sender != "sender"
                        ? Radius.circular(15.w.h)
                        : Radius.circular(0.w.h))),
            child: Text(
              text,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
        ),
        Visibility(
          visible: sender == "sender",
          child: FutureBuilder(
              future: SharedPreference().getuserurl(),
              builder: (context, snapshot) {
                return GestureDetector(
                  child: Container(
                    height: 25.h,
                    width: 25.w,
                    margin: EdgeInsets.only(
                      left: 5.w,
                      top: 5.h,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(!snapshot.data.toString().isURL
                                ? "https://i.imgur.com/BoN9kdC.png"
                                : snapshot.data.toString())),
                        //borderRadius: BorderRadius.circular(150.w.h),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
