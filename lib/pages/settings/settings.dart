import 'package:chatgpt/constant/utils/spacing.dart';
import 'package:chatgpt/controller/settingController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../services/SharedPrefences.dart';
import '../../utils/color.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Profile"),
              centerTitle: true,
            ),
            body: SafeArea(
                child: ListView(
              children: [
                sizedBoxheight20,
                FutureBuilder(
                    future: SharedPreference().getuserurl(),
                    builder: (context, snapshot) {
                      return !snapshot.data.toString().isURL
                          ? Container()
                          : Container(
                              height: 120.h,
                              width: 120.w,
                              margin: EdgeInsets.symmetric(horizontal: 0.w),

                              decoration: BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: new NetworkImage(
                                          snapshot.data.toString())),
                                  //borderRadius: BorderRadius.circular(150.w.h),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),

                              // child: ClipRRect(
                              //   borderRadius: BorderRadius.circular(150.w.h),
                              //   child: Image.network(
                              //       fit: BoxFit.fill,
                              //       "https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942406_960_720.jpg"),
                              // ),
                            );
                    }),
                sizedBoxheight20,
                FutureBuilder(
                  future: SharedPreference().getuseremail(),
                  builder: (context, snapshot) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                          color: greywhite,
                          borderRadius: BorderRadius.circular(10.w.h),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          "Email ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lighttextcolor),
                        ),
                        subtitle: Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: lighttextcolor),
                        ),
                        leading: Icon(
                          Icons.email,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxheight20,
                FutureBuilder(
                  future: SharedPreference().getusername(),
                  builder: (context, snapshot) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                          color: greywhite,
                          borderRadius: BorderRadius.circular(10.w.h),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          "Name ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lighttextcolor),
                        ),
                        subtitle: Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: lighttextcolor),
                        ),
                        leading: Icon(
                          Icons.supervised_user_circle,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    );
                  },
                ),
                sizedBoxheight20,
                GestureDetector(
                  onTap: () {
                    context.logout();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: greywhite,
                        borderRadius: BorderRadius.circular(10.w.h),
                        border: Border.all(color: Colors.black)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        "Log Out ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: lighttextcolor),
                      ),
                      trailing: Icon(
                        Icons.logout,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }
}
