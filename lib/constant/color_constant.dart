import 'package:flutter/material.dart';

class ColorConstant {
  static const Color appTransparent = Color(0x00000000);
  static const Color appWhite = Color(0xFFFFFFFF);
  static const Color appBlack = Color(0xFF000000);
  static const Color appGreen = Color(0xFF006F37);
  static const Color appYellow = Color(0xFFFB9516);
  static const Color appGrey = Color(0xFF9E9E9E);
  static const Color appLightGrey = Color(0xFFF5F5F5);
  static const Color appBlue = Color(0xFF002D66);
  static const Color appSkyBlue = Color(0xff3095D2);
  static const Color appLightBlue = Color(0xFF253342);
  static const Color appPurple = Color(0xFF7030A0);
  static const Color appRed = Color(0xFFE54D42);

  static OutlineInputBorder appOutlineInputBorder({Color? color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color: color ?? ColorConstant.appGrey.withOpacity(0.5), width: 0.7),
      );

  static BoxDecoration appCardDecoration() => BoxDecoration(
    color: ColorConstant.appWhite,
    border: Border.all(
        color: ColorConstant.appGrey.withOpacity(0.5), width: 0.7),
    borderRadius: BorderRadius.circular(5),
  );
}
