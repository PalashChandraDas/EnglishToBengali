
import 'package:englishtobengali/view/screens/home_screen/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/app_colors.dart';
import '../../widget/circle_button.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_feild.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //============================Appbar Start Code=======================//
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => CustomText(
              text: homeController.leftLanguage.value,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
                onPressed: () {
                  homeController.swapLanguages();
                },
                icon: Icon(
                  Icons.swap_horiz_outlined,
                  color: AppColors.whiteClr,
                  size: 25.sp,
                )),
            SizedBox(
              width: 10.w,
            ),
            Obx(() => CustomText(
              text: homeController.rightLanguage.value,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
          ],
        ),
      ),

      drawer: SafeArea(
          child: Drawer(
            child: DrawerWidget(
              onClickHome: () => Navigator.pop(context, false),
              onClickRateUs: () {
                Navigator.pop(context);
                homeController.launchAppReview();
              },
              onClickShareApp: () {
                Navigator.pop(context);
                Share.share(homeController.appShareUrl);
              },
              onClickPrivacyPolicy: () {
                Navigator.pop(context);
                homeController.launchPrivacy();
              },

              onClickExit: () {
                SystemNavigator.pop();
              },
            ),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            //=========================user input TextField section==========================//
            Stack(
              children: [
                customTextFeild(
                    controller: homeController.userInputcontroller,
                    hintText: "Type Here...",
                    maxLine: 8,
                    onChanged: (val) {
                      // print("print home screen");
                      homeController.inputText.value = val;
                    }),
                Positioned(
                    right: 20.w,
                    bottom: 20.h,
                    child: Row(
                      children: [
                        Obx(() {
                          return Visibility(
                            visible: homeController.inputText.value.isNotEmpty,
                            child: circleButton(
                                icon: Icons.clear,
                                ontap: () {
                                  homeController.clearText();
                                }),
                          );
                        }),
                        Obx(() => IconButton(
                          icon: Icon(homeController.isListening.value
                              ? Icons.mic
                              : Icons.mic_none),
                          onPressed: homeController.isListening.value
                              ? homeController.stopListening
                              : () {
                            homeController.startListening(
                                homeController.fromLanguage.value);
                          },
                        )),
                      ],
                    ))
              ],
            ),
            //==============================Translated Button==========================//

            customButton(
                title: "Translate",
                ontap: () {
                  homeController.translate();
                }),

            //===============================Translated Output Container=================//

            SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 290.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border:
                      Border.all(width: 2.w, color: AppColors.primaryClr)),
                  child: Obx(
                        () => Center(
                      child: CustomText(
                        text: homeController.translatedText.value,
                        color: AppColors.blackClr,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10.h,
                    right: 30.w,
                    child: Row(
                      children: [
                        //==========================Text to speak section===================//
                        Obx(
                              () => circleButton(
                              ontap: () {
                                homeController.textToSpeech();
                              },
                              icon: homeController.isSpeaking.value
                                  ? Icons.volume_off
                                  : Icons.volume_up_outlined),
                        ),
                        circleButton(icon: Icons.heart_broken),
                        circleButton(
                            ontap: () {
                              homeController.shareTranslatedText();
                            },
                            icon: Icons.share),
                        //==========================Copy Clipboard section===================//
                        circleButton(
                            ontap: () {
                              homeController.copyToClipboard();
                            },
                            icon: Icons.copy_all_outlined),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

