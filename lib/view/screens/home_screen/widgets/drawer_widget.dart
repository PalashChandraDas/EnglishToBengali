import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/custom_text.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onClickHome;
  final VoidCallback onClickRateUs;
  final VoidCallback onClickShareApp;
  final VoidCallback onClickPrivacyPolicy;
  final VoidCallback onClickExit;

  final String headerTxt = 'English to Bangla';

  const DrawerWidget({
    super.key,
    required this.onClickHome,
    required this.onClickRateUs,
    required this.onClickShareApp,
    required this.onClickPrivacyPolicy,
    required this.onClickExit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.h,
          color: AppColors.primaryClr,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: headerTxt,
                  fontSize: 22,
                  color: AppColors.whiteClr,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ListTile(
                title: const CustomText(
                  text: "Home",
                  textAlign: TextAlign.start,
                  color: AppColors.blackClr,
                  fontSize: 16,
                ),
                leading: Icon(
                  Icons.home,
                  size: 24.w,
                ),
                onTap: onClickHome,
              ),
              ListTile(
                title: const CustomText(
                  text: "Rate us",
                  textAlign: TextAlign.start,
                  color: AppColors.blackClr,
                  fontSize: 16,
                ),
                leading: Icon(
                  Icons.star,
                  size: 24.w,
                ),
                onTap: onClickRateUs,
              ),
              ListTile(
                title: const CustomText(
                  text: "Share app",
                  textAlign: TextAlign.start,
                  color: AppColors.blackClr,
                  fontSize: 16,
                ),
                leading: Icon(
                  Icons.share,
                  size: 24.w,
                ),
                onTap: onClickShareApp,
              ),
              ListTile(
                title: const CustomText(
                  text: "Privacy Policy",
                  textAlign: TextAlign.start,
                  color: AppColors.blackClr,
                  fontSize: 16,
                ),
                leading: Icon(
                  Icons.privacy_tip,
                  size: 24.w,
                ),
                onTap: onClickPrivacyPolicy,
              ),
              ListTile(
                title: const CustomText(
                  text: "Exit",
                  textAlign: TextAlign.start,
                  color: AppColors.blackClr,
                  fontSize: 16,
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  size: 24.w,
                ),
                onTap: onClickExit,
              ),
            ],
          ),
        )
      ],
    );
  }
}
