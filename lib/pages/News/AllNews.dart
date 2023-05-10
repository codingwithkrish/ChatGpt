import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:chatgpt/widgets/Widgethelper1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/AllNews.controller.dart';
import '../../utils/color.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllNewsController>(
        init: AllNewsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Trending News"),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(120.0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                    child: Column(children: [
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 5.w),
                        padding: EdgeInsets.all(3.h.w),
                        child: Row(children: [
                          Expanded(
                              child: textfieldNews(
                                  controller.textEditingController,
                                  controller)),
                          IconButton(
                              onPressed: () {
                                controller.getnewsbysearch();
                              },
                              icon: Icon(Icons.search))
                        ]),
                      ),
                      listofchips(controller)
                    ]),
                  ),
                ),
              ),
              // backgroundColor: greywhite,
              automaticallyImplyLeading: false,
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: ListView(
                children: [
                  sizedBoxheight20,
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hot & Treanding News .....",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  sizedBoxheight20,
                  carsoulSlider(controller.newsmodel),
                  sizedBoxheight14,
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Your Personalized News ",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  sizedBoxheight14,
                  controller.isloading
                      ? Center(child: CircularProgressIndicator())
                      : listofnews(controller.newsmodel1)
                ],
              ),
            )),
          );
        });
  }
}
