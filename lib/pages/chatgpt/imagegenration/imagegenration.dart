import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/ImageGenrationController.dart';
import '../../../utils/color.dart';

class ImageGenration extends StatelessWidget {
  const ImageGenration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageGenerationController>(
        init: ImageGenerationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: controller.load == true
                ? Colors.black.withOpacity(0.3)
                : Colors.black,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        readOnly: !(controller.load == false &&
                            controller.isdownloding == false),
                        controller: controller.searchtext,
                        decoration: InputDecoration(
                          fillColor: primarycolor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primarycolor),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          hoverColor: primarycolor,
                          focusColor: primarycolor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: primarycolor),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          hintText: "Search for any image",
                          suffixIcon: GestureDetector(
                              onTap: () {
                                controller.getrequest();
                              },
                              child: Icon(
                                Icons.search,
                              )),
                          helperText: "Eg. A boy sitting in the cow",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                          visible: controller.load == true,
                          child: Lottie.network(
                              "https://assets8.lottiefiles.com/packages/lf20_WaUeHZQSyN.json")),
                      Visibility(
                          visible: controller.isdownloding == true,
                          child: Lottie.network(
                              "https://assets8.lottiefiles.com/private_files/lf30_37Dhw7.json")),
                      Visibility(
                        visible: (controller.load == false &&
                                controller.images.isNotEmpty &&
                                controller.isdownloding == false)
                            ? true
                            : false,
                        child: Expanded(
                          child: GridView.builder(
                              itemCount: controller.images.length,
                              //shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 2,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1),
                              itemBuilder: (context, i) {
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.w.h),
                                      ),
                                      margin: EdgeInsets.all(10),
                                      child: ClipRRect(
                                        //border: Border.all(color: textColor),
                                        borderRadius:
                                            BorderRadius.circular(20.w.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(Scaffold(
                                              body: ClipRRect(
                                                child: Center(
                                                    child: Image.network(
                                                  controller.images[i],
                                                  fit: BoxFit.fill,
                                                )),
                                              ),
                                            ));
                                          },
                                          child: Image.network(
                                            controller.images[i],
                                            height: 150,
                                            width: 150,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: primarycolor,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.downloadimage(
                                            controller.images[i]);
                                      },
                                      child: Transform.translate(
                                        offset: Offset(10, 10),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 10),
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              Icons.download,
                                              color: primarycolor,
                                            )),
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ),
                      ),
                      Visibility(
                          visible: controller.error,
                          child: Text(
                            controller.err.toString(),
                          ))
                    ],
                  ),
                ],
              ),
            )),
          );
        });
  }
}
