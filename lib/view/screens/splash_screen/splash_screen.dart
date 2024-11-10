import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 03), ()=>Get.offAllNamed(AppRoute.bottomNav));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryClr,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.w)),
              image: const DecorationImage(image: AssetImage(AppImage.appLogo)),
        
            ),
          ),
        ),
      ),

    );
  }
}
