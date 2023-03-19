import 'dart:convert';

import 'package:chatgpt/models/newsModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<NewsModel> newsmodel = [];
  bool isloading = false;
  List<NewsModel> newsmodel1 = [];
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
  HomeController() {
    getnews();
    getnewsbycategory();
  }
  getnews() async {
    http.Response response = await http.get(Uri.parse(api));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List list = jsonDecode(response.body)["articles"];
      print(list.length);
      if (list.length >= 10) {
        for (var i = 0; i < 10; i++) {
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
      if (list.length >= 20) {
        for (var i = 0; i < 10; i++) {
          newsmodel1.add(NewsModel.fromjson(list[i]));
          update();
        }
      } else {
        for (var i = 0; i < list.length; i++) {
          newsmodel1.add(NewsModel.fromjson(list[i]));
          update();
        }
      }
    }
    isloading = false;
    update();
    print(newsmodel.length);
  }
}
