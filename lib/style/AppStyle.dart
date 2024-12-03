import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight_news/style/AppColors.dart';

class AppStyle{
static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24.sp,
      color: Colors.white,
      fontWeight: FontWeight.w700
    ),
    titleMedium: TextStyle(
      fontSize: 24.sp,
      color: AppColors.iconColor,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.greyColor
    ),

  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25.sp
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50.r),
        bottomRight: Radius.circular(50.r),
      )
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 22.sp
    )
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
  primary: AppColors.primaryColor

  ),
  useMaterial3: true,
);
}