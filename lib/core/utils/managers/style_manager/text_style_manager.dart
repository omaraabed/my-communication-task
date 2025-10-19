import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager/color_manager.dart';

class TextStyleManager {
  static double adaptiveFontSize(double size) {
    double scaleFactor = ScreenUtil().screenWidth > 600 ? 0.6 : 1.0;
    return (size * scaleFactor).sp;
  }

  // ================ Test Style 12 ================
  static TextStyle style12BoldYellow = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
    color: ColorManager.yellow,
  );
  static TextStyle style12RegBlack = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );

  // ================ Test Style 14 ================

  static TextStyle style14RegBlack = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );

  // ================ Test Style 18 ================

  static TextStyle style18BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );

  static TextStyle style32BoldBlackWithWhiteShadow = TextStyle(
    fontSize: adaptiveFontSize(32),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
    shadows: [
      Shadow(offset: Offset(-0.5, -0.5), color: ColorManager.lightBlue),
      Shadow(offset: Offset(0.5, -0.5), color: ColorManager.lightBlue),
      Shadow(offset: Offset(0.5, 0.5), color: ColorManager.lightBlue),
      Shadow(offset: Offset(-0.5, 0.5), color: ColorManager.lightBlue),
    ],
  );
}
