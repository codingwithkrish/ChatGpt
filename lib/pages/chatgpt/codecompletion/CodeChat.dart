import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color.dart';

class CodeChat extends StatelessWidget {
  const CodeChat(
      {Key? key,
      required this.text,
      required this.sender,
      required this.codeController})
      : super(key: key);
  final String text;
  final String sender;
  final CodeController codeController;

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
            child: CodeField(
              controller: codeController,
              enabled: false,
            ),
          ),
        )
      ],
    );
  }
}
