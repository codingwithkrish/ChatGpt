import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../widgets/Widgethelper1.dart';
import 'CodeMessage.dart';

class CodeHome extends StatefulWidget {
  const CodeHome({super.key});

  @override
  State<CodeHome> createState() => _CodeHomeState();
}

class _CodeHomeState extends State<CodeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("For Developer's"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          sizedBoxheight14,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: container1("Explain Code", "assets/images/code.png", () {
                  Get.to(CodeMessage(
                    name: "Explain Code",
                    i: 0,
                  ));
                }),
              ),
              Expanded(
                flex: 1,
                child: container1(
                    "Python Bug Fixes", "assets/images/python.png", () {
                  Get.to(CodeMessage(
                    name: "Python Bug Fixes",
                    i: 1,
                  ));
                }),
              ),
            ],
          ),
          sizedBoxheight14,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: container1(
                    "Translate One Programming Languages to other",
                    "assets/images/translate.png", () {
                  Get.to(CodeMessage(
                    name: "Translate One Programming Languages to other",
                    i: 2,
                  ));
                }),
              ),
              Expanded(
                flex: 1,
                child: container1("Calculate Time Complexity",
                    "assets/images/timecomplexity.png", () {
                  Get.to(CodeMessage(
                    name: "Calculate Time Complexity",
                    i: 3,
                  ));
                }),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
