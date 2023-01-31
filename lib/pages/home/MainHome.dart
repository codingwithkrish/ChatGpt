import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controller/HomeController.dart';
import '../../widgets/Widgethelper1.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    sizedBoxheight14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [container1(), container1()],
                    ),
                    sizedBoxheight14,
                    container1(),
                    sizedBoxheight14,
                    carsoulSlider()
                  ],
                ),
              ),
            )),
          );
        });
  }
}
