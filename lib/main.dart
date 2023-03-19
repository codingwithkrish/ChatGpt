import 'package:camera/camera.dart';
import 'package:chatgpt/pages/home/Home.dart';
import 'package:chatgpt/pages/home/MainHome.dart';
import 'package:chatgpt/services/SharedPrefences.dart';
import 'package:chatgpt/utils/theames.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/MainController.dart';
import 'pages/Authentication/Login.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  await Permission.microphone.request();
  cameras = await availableCameras();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'ChatGpt',
        debugShowCheckedModeBanner: false,
        darkTheme: Apptheme.darktheme,
        theme: Apptheme.lighttheme,
        home: GetBuilder<MainController>(
            init: MainController(),
            builder: (controller) {
              return FutureBuilder<bool?>(
                future: controller.getuserinfo(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    //return MainHome();
                    return Home();
                  } else {
                    return Login();
                  }
                },
              );
            }),
      );
    });
  }
}
