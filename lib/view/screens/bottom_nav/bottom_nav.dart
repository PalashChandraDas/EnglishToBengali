import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../favourite_screen/favourite_screen.dart';
import '../history_screen/history_screen.dart';
import '../home_screen/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex=0;
  final List pages=[
    HomeScreen(),
    const HistoryScreen(),
    const FavouriteScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryClr,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavyBar(
        iconSize: 25.sp,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: AppColors.primaryClr,
        selectedIndex: currentIndex,
        containerHeight: 50.h,
        itemPadding: EdgeInsets.symmetric(horizontal: 5.h),
        onItemSelected: (index){
          setState(() {
            currentIndex=index;

          });

        },
        items: [
          BottomNavyBarItem(
           activeColor: Colors.white,
              icon: const Icon(Icons.home, color: AppColors.whiteClr,), title: const Text("Home", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.history, color: AppColors.whiteClr,), title: const Text("History", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),

          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: const Icon(Icons.heart_broken, color: AppColors.whiteClr,), title: const Text("Favorite", style: TextStyle(
            color: AppColors.whiteClr,
          ),)),
        ],

      )
    );
  }
}
