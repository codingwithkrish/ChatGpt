import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

import '../services/request/Request.dart';

class ImageGenerationController extends GetxController {
  ImageGenerationController();
  TextEditingController searchtext = new TextEditingController();
  List<String> images = [];
  bool load = false;
  bool isdownloding = false;
  bool error = false;
  String err = "";
  getrequest() async {
    load = true;
    error = false;
    images.clear();
    update();
    var data = {
      "prompt": searchtext.text.toString(),
      "n": 10,
      "size": "1024x1024"
    };
    if (!searchtext.text.isEmpty) {
      var response = await Request()
          .getrequest("https://api.openai.com/v1/images/generations", data);
      if (response is List) {
        for (var element in response) {
          images.add(element["url"]);
        }
      } else {
        error = true;
        err = response;
      }
    }
    load = false;
    update();
  }

  downloadimage(String url) async {
    isdownloding = true;
    update();
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    Map<Object, Object> data = result;
    if (data["isSuccess"] == true) {
      Get.rawSnackbar(message: "Image downloaded");
    } else {
      Get.rawSnackbar(
          message: "Unable to download image due to ${data["errorMessage"]}");
    }

    isdownloding = false;
    update();
  }
}
