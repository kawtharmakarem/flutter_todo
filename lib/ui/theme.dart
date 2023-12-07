import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color orangeClr = Color(0xcfff8746);
const Color pinkClr = Color(0xffff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xff121212);
const Color darkHeaderClr = Color(0xff424242);

class Themes {
  static final light = ThemeData(
      primaryColor: primaryClr,
      colorScheme: ColorScheme.light(background: Colors.white),
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      colorScheme: ColorScheme.dark(background: darkGreyClr),
      brightness: Brightness.dark);

  //declare textstyles by getter
 
}

 TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
  }
  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
  }
  TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
  }
  TextStyle get subTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ));
  }
