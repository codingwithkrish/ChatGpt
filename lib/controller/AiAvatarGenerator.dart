import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import '../services/request/Request.dart';
import 'package:path/path.dart' as path;

import '../widgets/Widgethelper1.dart';

class AiAvatarGeneratorControler extends GetxController {
  int currentstep = 0;
  bool pickimaged = false;
  File? imagepath;
  String caricatureUrl = "";
  int gender = 0;
  String avatarid = "";
  bool isdownloding = false;
  bool isuploading = false;
  bool iscaricature = false;
  String imageurl = "";
  AiAvatarGeneratorControler();
  getav(String path) {
    Request().getavatar(path);
  }

  pickimage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final extension = path.extension(image!.path);
      if (extension.toLowerCase() == ".png" ||
          extension.toLowerCase() == ".jpg") {
        pickimaged = true;
        imagepath = File(image.path);
        update();
        Get.back();
      } else {
        showimagenotformat(context);
      }
    }
  }

  uploadimage() async {
    isuploading = true;
    update();
    String data = await Request().getavatar(imagepath!.path);
    print(data);

    imageurl = jsonDecode(data)["Result"]["AvatarIconUrl"];
    gender = jsonDecode(data)["Result"]["Gender"];
    avatarid = jsonDecode(data)["Result"]["AvatarId"];
    currentstep++;
    isuploading = false;
    update();
  }

  downloadimage(String url) async {
    isdownloding = true;
    update();
    String datetimenow =
        "${DateTime.now().toString()}${DateTime.now().toString()}${DateTime.now().year.toString()}";
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "img${datetimenow}");
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

  genratecaricature(String avatarId, int gender) async {
    iscaricature = true;
    update();
    Map<String, dynamic> json =
        jsonDecode(await Request().getcaricature(avatarId, gender));
    caricatureUrl = json["Result"]["PreviewUrl"];
    iscaricature = false;
    currentstep++;
    update();
  }
}
