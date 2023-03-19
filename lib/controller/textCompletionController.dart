import 'package:chatgpt/pages/chatgpt/textcompletion.dart/Chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:chatgpt/services/request/Request.dart';

class TextCompletionController extends GetxController {
  TextEditingController controller1 = new TextEditingController();
  bool istyping = false;

  List<Chat> chat = [];
  ScrollController scrollController = ScrollController();
  double maxscroll = 0.0;
  TextCompletionController();
  sendmessage(Chat message) async {
    chat.add(message);
    istyping = true;
    controller1.clear();

    update();
    checkbottom();
    print(scrollController.position.maxScrollExtent);

    String txt = await Request().gettextcompletion(message.text);
    chat.add(Chat(text: txt, sender: "chatgpt"));
    istyping = false;
    update();
    checkbottom();
    print(scrollController.position.maxScrollExtent);
  }

  checkbottom() {
    double newscroll = scrollController.position.maxScrollExtent;
    if (newscroll >= maxscroll) {
      final position = scrollController.position.maxScrollExtent;
      scrollController.jumpTo(position);

      update();
    }
  }
}
