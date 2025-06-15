import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextTheme on TextTheme {
  TextStyle get ebGaramondBlack => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 16.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w900,
  );

  TextStyle get ebGaramondBlackItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 26.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondExtraBold => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 13.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w800,
  );

  TextStyle get ebGaramondBold => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 19.sp,
    color: const Color(0xFF000000),
    fontWeight: FontWeight.w700,
  );

  TextStyle get ebGaramondBoldItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 32.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondSemiBold => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 16.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w600,
  );

  TextStyle get ebGaramondSemiBoldItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 18.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondMedium => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 16.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w500,
  );

  TextStyle get ebGaramondMediumItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 16.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondRegular => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 14.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w400,
  );

  TextStyle get ebGaramondRegularItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 14.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondLight => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 18.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w300,
  );

  TextStyle get ebGaramondLightItalic => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 14.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  TextStyle get ebGaramondThin => TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 18.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w100,
  );
}
