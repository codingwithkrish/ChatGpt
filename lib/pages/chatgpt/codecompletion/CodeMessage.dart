import 'package:chatgpt/controller/CodeCompletionConroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/Widgethelper1.dart';

class CodeMessage extends StatefulWidget {
  String name;
  int i;
  CodeMessage({Key? key, required this.name, required this.i})
      : super(key: key);

  @override
  State<CodeMessage> createState() => _CodeMessageState();
}

class _CodeMessageState extends State<CodeMessage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CodeCompletionController>(
        init: CodeCompletionController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.name),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: SafeArea(
                child: Column(
              children: [
                Flexible(
                    child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.chat.length,
                        itemBuilder: (context, index) {
                          return controller.chat[index];
                        })),
                controller.istyping
                    ? Lottie.network(
                        "https://assets6.lottiefiles.com/packages/lf20_PcNJDBsKnE.json",
                        width: 100.w,
                        height: 30.h)
                    : Container(),
                Container(
                  child: buildTextComposercode(controller, widget.i),
                )
              ],
            )),
          );
        });
  }
}
