import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/newsModel.dart';
import 'package:http/http.dart' as http;

class AllNewsController extends GetxController {
  List<NewsModel> newsmodel = [];
  TextEditingController textEditingController = new TextEditingController();
  List<NewsModel> newsmodel1 = [];
  bool isloading = false;
  List string = [
    "Cricket",
    "India",
    "USA",
    "Covid",
    "Bollywood",
    "Dance",
    "Murder",
    "Train",
    "Ai",
    "Coding",
    "Google",
    "Microsoft",
    "Song",
    "ChatGpt",
    "Pune",
  ];
  String domain = "cricket";
  String api =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=9561da83005649bb9d198deb8dd116c0";
  String uri = "https://newsapi.org/v2/everything?q=";
  String back = "&sortBy=popularity&apiKey=9561da83005649bb9d198deb8dd116c0";
  AllNewsController() {
    getnews();
    getnewsbycategory();
  }
  getnews() async {
    http.Response response = await http.get(Uri.parse(api));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List list = jsonDecode(response.body)["articles"];
      print(list.length);
      if (list.length >= 20) {
        for (var i = 0; i < 20; i++) {
          newsmodel.add(NewsModel.fromjson(list[i]));
          update();
        }
      } else {
        for (var i = 0; i < list.length; i++) {
          newsmodel.add(NewsModel.fromjson(list[i]));
          update();
        }
      }
    }
    print(newsmodel.length);
  }

  getnewsbysearch() async {
    newsmodel1.clear();
    isloading = true;
    update();
    if (textEditingController.text.toString().isNotEmpty) {
      http.Response response = await http.get(
          Uri.parse("${uri}${textEditingController.text.toString()}${back}"));
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List list = jsonDecode(response.body)["articles"];
        print(list.length);
        for (var element in list) {
          newsmodel1.add(NewsModel.fromjson(element));
          update();
        }
        // if (list.length >= 20) {
        //   for (var i = 0; i < 20; i++) {

        //   }
        // } else {
        //   for (var i = 0; i < list.length; i++) {
        //     newsmodel1.add(NewsModel.fromjson(list[i]));
        //     update();
        //   }
        // }
      }
    }

    isloading = false;
    update();
    print(newsmodel.length);
  }

  getnewsbycategory() async {
    newsmodel1.clear();
    isloading = true;
    update();
    http.Response response =
        await http.get(Uri.parse("${uri}${domain}${back}"));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List list = jsonDecode(response.body)["articles"];
      print(list.length);
      for (var element in list) {
        newsmodel1.add(NewsModel.fromjson(element));
        update();
      }
      // if (list.length >= 20) {
      //   for (var i = 0; i < 20; i++) {

      //   }
      // } else {
      //   for (var i = 0; i < list.length; i++) {
      //     newsmodel1.add(NewsModel.fromjson(list[i]));
      //     update();
      //   }
      // }
    }
    isloading = false;
    update();
    print(newsmodel.length);
  }
}
