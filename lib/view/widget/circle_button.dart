import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

Widget circleButton({icon, ontap}){

  return InkWell(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.all(7.r),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryClr,
      ),
      child: Center(child: Icon(icon, color: AppColors.whiteClr,size: 27.sp,)),
    ),
  );
}