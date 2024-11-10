import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

Widget customTextFeild({controller,ValueChanged<String>? onChanged, String? hintText,  maxLine, }) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: TextField(
      controller: controller,
      onChanged: onChanged,

      maxLines: maxLine,
      decoration: InputDecoration(

        hintText: hintText,
        helperStyle: TextStyle(
          color: AppColors.blackClr,
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 2.h,
            color: AppColors.primaryClr
          )
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                width: 2.h,
                color: AppColors.primaryClr
            )
        ),
      ),
    ),
  );
}
