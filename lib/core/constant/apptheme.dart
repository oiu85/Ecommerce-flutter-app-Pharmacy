import 'package:flutter/material.dart';

import 'color.dart';

ThemeData  themeEnglish = ThemeData(
  fontFamily:"PlayfairDisplay",
  appBarTheme: AppBarTheme(
    color: Colors.grey[50],
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        fontSize: 30),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  textTheme:  const TextTheme(
    headlineLarge:TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:26,color: AppColor.black ),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:22,color: AppColor.black ),
    bodyLarge:TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontSize: 14),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
ThemeData  themeArabic = ThemeData(
  fontFamily:"Cairo",
  appBarTheme: AppBarTheme(
    color: Colors.grey[50],
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 30),
  ),
  textTheme:  const TextTheme(
    headlineLarge:TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:26,color: AppColor.black ),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:22,color: AppColor.black ),
    bodyLarge:TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontSize: 14),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
