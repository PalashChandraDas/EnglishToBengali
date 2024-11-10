
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static var myAppTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryClr,
          iconTheme: IconThemeData(
              color: AppColors.whiteClr
          )
      )
  );
}