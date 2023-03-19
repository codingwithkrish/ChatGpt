import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../controller/textCompletionController.dart';
import '../../services/SharedPrefences.dart';
import '../../utils/color.dart';
import '../../widgets/Widgethelper1.dart';
import '../settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// ZoomDrawer(
//   controller: ZoomDrawerController,
//   menuScreen: MenuScreen(),
//   mainScreen: MainScreen(),
//   borderRadius: 24.0,
//   showShadow: true,
//   angle: 0.0,
//   drawerShadowsBackgroundColor: Colors.grey[300],
//   slideWidth: MediaQuery.of(context).size.width * 0.65,
// )
class _HomeState extends State<Home> {
  TextCompletionController controller = new TextCompletionController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 24.0,
      controller: ZoomDrawerController(),
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: greywhite,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      mainScreen: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          border: Border.all(color: primarycolor),
                          borderRadius: BorderRadius.circular(10.w.h)),
                      alignment: Alignment.center,
                      child: Row(children: [
                        Icon(
                          Icons.video_library_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Watch a Demo",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Text(
            "ChatGpt",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [
            FutureBuilder(
                future: SharedPreference().getuserurl(),
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => Settings());
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      margin: EdgeInsets.only(right: 10.w, top: 2.h),

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  !snapshot.data.toString().isURL
                                      ? "https://i.imgur.com/BoN9kdC.png"
                                      : snapshot.data.toString())),
                          //borderRadius: BorderRadius.circular(150.w.h),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),

                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(150.w.h),
                      //   child: Image.network(
                      //       fit: BoxFit.fill,
                      //       "https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942406_960_720.jpg"),
                      // ),
                    ),
                  );
                }),
          ],
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Flexible(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ListView(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "ChatGpt",
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.w700),
                        )),
                    sizedBoxheight5,
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                            "The AI Revolution: Changing Industries and Lives",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w500))),
                    sizedBoxheight14,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10.w.h)),
                      child: Column(
                        children: [
                          sizedBoxheight14,
                          Text(
                            "Quick Example of what you can do",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                            textAlign: TextAlign.center,
                          ),
                          sizedBoxheight14,
                          boxhome(
                              () {},
                              "Write a factual content on the latest topics,including today's news",
                              "Write a factual content on the latest topics,including today's news"),
                          sizedBoxheight5,
                          boxhome(() {
                            Get.to(MainHome());
                          }, "Write a factual content on the latest topics,including today's news",
                              "Write a factual content on the latest topics,including today's news"),
                          sizedBoxheight5,
                          boxhome(
                              () {},
                              "Write a factual content on the latest topics,including today's news",
                              "Write a factual content on the latest topics,including today's news"),
                          sizedBoxheight5,
                          boxhome(
                              () {},
                              "Write a factual content on the latest topics,including today's news",
                              "Write a factual content on the latest topics,including today's news"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              //flex: ,
              child: Container(
                // /  height: 40.h,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w.h),
                        topRight: Radius.circular(10.w.h))),
                //  padding: EdgeInsets.all(2.w.h),
                child: buildTextComposer(controller),
              ),
            ),
          ],
        )),
      ),
      menuScreen: Container(),
    );
  }
}
