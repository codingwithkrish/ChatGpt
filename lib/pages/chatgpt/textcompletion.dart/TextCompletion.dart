import 'package:chatgpt/controller/textCompletionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/Widgethelper1.dart';

class TextCompletion extends StatelessWidget {
  TextCompletion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextCompletionController>(
        init: TextCompletionController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("AI Comapnion"),
              centerTitle: true,
            ),
            resizeToAvoidBottomInset: true,
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
                  child: buildTextComposer(controller),
                )
              ],
            )),
          );
        });
  }
}
