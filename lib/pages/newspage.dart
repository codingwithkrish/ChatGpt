import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:chatgpt/models/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/color.dart';

class NewsPage extends StatefulWidget {
  NewsModel model;
  NewsPage({Key? key, required this.model}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Text(
            widget.model.tittle.toString(),
            // style: TextStyling.style1,
          ),
          sizedBoxheight5,
          Image.network(widget.model.imageurl.toString()),
          sizedBoxheight14,
          Text(
            widget.model.description.toString(),
            //  style: TextStyling.style2,
          ),
          sizedBoxheight5,
          GestureDetector(
            onTap: () {
              Get.to(Scaffold(
                body: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: Uri.parse(widget.model.url.toString()))),
              ));
            },
            child: Text(
              "more on this.........",
              style: TextStyle(color: primarycolor, fontSize: 15.sp),
            ),
          ),
          sizedBoxheight14,
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              "Sources - ${widget.model.newsname}",
            ),
          )
        ],
      )),
    );
  }
}
