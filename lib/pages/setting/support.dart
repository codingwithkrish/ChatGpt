import 'package:chatgpt/pages/setting/settingwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/supportController.dart';
import '../../widgets/Widgethelper1.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
        init: SupportController(),
        builder: (controller) {
          return controller.issending
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: Text("Support & Help"),
                  ),
                  body: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Send an Email to us if you have any problem or complaint",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text("Subject:"),
                        textfieldSupport(controller.subjectController, 2),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text("Body:"),
                        textfieldSupport(controller.bodyController, 5),
                        SizedBox(
                          height: 15.h,
                        ),
                        LoginButton("Submit", () {
                          controller.sendEmail();
                        })
                      ],
                    ),
                  ),
                );
        });
  }
}
