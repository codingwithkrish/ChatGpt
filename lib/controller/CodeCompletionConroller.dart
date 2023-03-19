import 'package:chatgpt/pages/chatgpt/codecompletion/CodeChat.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/request/Request.dart';

class CodeCompletionController extends GetxController {
  TextEditingController controller1 = new TextEditingController();
  bool istyping = false;

  List<CodeChat> chat = [];
  ScrollController scrollController = ScrollController();
  double maxscroll = 0.0;
  sendmessage(CodeChat message) async {
    chat.add(message);
    istyping = true;
    controller1.clear();

    update();

    print(scrollController.position.maxScrollExtent);

    String txt = await Request().getcodecompletion(message.text);
    CodeController codeController = new CodeController(
      text: txt,
      patternMap: {
        r"\B#[a-zA-Z0-9]+\b":
            TextStyle(fontWeight: FontWeight.bold, color: Colors.purpleAccent),
      },
    );
    chat.add(CodeChat(
      text: txt,
      sender: "chatgpt",
      codeController: codeController,
    ));
    istyping = false;
    update();

    print(scrollController.position.maxScrollExtent);
  }
}
