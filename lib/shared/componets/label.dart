// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../utils/constants/enums.dart';

// class Label extends StatelessWidget {
//   final String text;
//   final Color? color;
//   final StyleKey styleKey;
//   final int? maxLines;
//   final bool? softWrap;
//   final TextOverflow? overflow;
//   final TextAlign? textAlign;
//   final FontWeight? fontWeight;
//   final String? fontFamily;
//   final double? fontSize;
//   final double? height;
//   final List<Shadow>? shadows;
//   final TextDecoration? decoration;

//   const Label(
//     this.text, {
//     super.key,
//     this.color,
//     this.styleKey = StyleKey.bodyText2,
//     this.maxLines,
//     this.softWrap,
//     this.overflow,
//     this.textAlign,
//     this.fontWeight,
//     this.fontFamily,
//     this.fontSize,
//     this.height,
//     this.shadows,
//     this.decoration,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = _getTextStyle(context, styleKey).copyWith(
//       color: color ?? _getTextStyle(context, styleKey).color,
//       fontFamily: fontFamily ?? 'RSU',
//       fontSize: fontSize,
//       fontWeight: fontWeight,
//       height: height,
//       shadows: shadows,
//       decoration: decoration,
//     );
//     final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
//     // กำหนดขนาดตัวคูณของ textScaleFactor ให้ไม่เกิน 1
//     double adjustedTextScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);
//     return Text(
//       text,
//       style: textStyle,
//       maxLines: maxLines ?? defaultTextStyle.maxLines,
//       softWrap: softWrap ?? defaultTextStyle.softWrap,
//       overflow: overflow ?? defaultTextStyle.overflow,
//       textAlign: textAlign ?? defaultTextStyle.textAlign,
//       textScaleFactor: adjustedTextScaleFactor,
//     );
//   }

//   TextStyle _getTextStyle(BuildContext context, StyleKey textStyleKey) {
//     final themeData = Theme.of(context).textTheme;
//     switch (textStyleKey) {
//       case StyleKey.headline1:
//         return themeData.displayLarge!.copyWith(fontSize: themeData.displayLarge?.fontSize?.sp);
//       case StyleKey.headline2:
//         return themeData.displayMedium!.copyWith(fontSize: themeData.displayMedium?.fontSize?.sp);
//       case StyleKey.headline3:
//         return themeData.displaySmall!.copyWith(fontSize: themeData.displaySmall?.fontSize?.sp);
//       case StyleKey.headline4:
//         return themeData.headlineMedium!.copyWith(fontSize: themeData.headlineMedium?.fontSize?.sp);
//       case StyleKey.headline5:
//         return themeData.headlineSmall!.copyWith(fontSize: themeData.headlineSmall?.fontSize?.sp);
//       case StyleKey.headline6:
//         return themeData.titleLarge!.copyWith(fontSize: themeData.titleLarge?.fontSize?.sp);
//       case StyleKey.bodyText1:
//         return themeData.bodyLarge!.copyWith(fontSize: themeData.bodyLarge?.fontSize?.sp);
//       case StyleKey.bodyText2:
//         return themeData.bodyMedium!.copyWith(fontSize: themeData.bodyMedium?.fontSize?.sp);
//       case StyleKey.caption:
//         return themeData.bodySmall!.copyWith(fontSize: themeData.bodySmall?.fontSize?.sp);
//       case StyleKey.button:
//         return themeData.labelLarge!.copyWith(fontSize: themeData.labelLarge?.fontSize?.sp);
//       case StyleKey.overline:
//         return themeData.labelSmall!.copyWith(fontSize: themeData.labelSmall?.fontSize?.sp);
//       // Add more cases for other text styles you want to support
//     }
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/enums.dart';

class Label extends StatelessWidget {
  final String text;
  final Color? color;
  final StyleKey styleKey;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final List<Shadow>? shadows;
  final TextDecoration? decoration;

  const Label(
    this.text, {
    super.key,
    this.color,
    this.styleKey = StyleKey.bodyText2,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.height,
    this.shadows,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = _getTextStyle(context, styleKey).copyWith(
      color: color ?? _getTextStyle(context, styleKey).color,
      fontFamily: fontFamily ?? 'RSU',
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      shadows: shadows,
      decoration: decoration,
    );
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    double adjustedTextScaleFactor = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);

    return Text(
      text,
      style: textStyle,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      softWrap: softWrap ?? defaultTextStyle.softWrap,
      overflow: overflow ?? defaultTextStyle.overflow,
      textAlign: textAlign ?? defaultTextStyle.textAlign,
      textScaleFactor: adjustedTextScaleFactor,
    );
  }

  TextStyle _getTextStyle(BuildContext context, StyleKey textStyleKey) {
    final themeData = Theme.of(context).textTheme;
    switch (textStyleKey) {
      case StyleKey.headline1:
        return themeData.displayLarge!.copyWith(fontSize: themeData.displayLarge?.fontSize?.sp);
      case StyleKey.headline2:
        return themeData.displayMedium!.copyWith(fontSize: themeData.displayMedium?.fontSize?.sp);
      case StyleKey.headline3:
        return themeData.displaySmall!.copyWith(fontSize: themeData.displaySmall?.fontSize?.sp);
      case StyleKey.headline4:
        return themeData.headlineMedium!.copyWith(fontSize: themeData.headlineMedium?.fontSize?.sp);
      case StyleKey.headline5:
        return themeData.headlineSmall!.copyWith(fontSize: themeData.headlineSmall?.fontSize?.sp);
      case StyleKey.headline6:
        return themeData.titleLarge!.copyWith(fontSize: themeData.titleLarge?.fontSize?.sp);
      case StyleKey.bodyText1:
        return themeData.bodyLarge!.copyWith(fontSize: themeData.bodyLarge?.fontSize?.sp);
      case StyleKey.bodyText2:
        return themeData.bodyMedium!.copyWith(fontSize: themeData.bodyMedium?.fontSize?.sp);
      case StyleKey.caption:
        return themeData.bodySmall!.copyWith(fontSize: themeData.bodySmall?.fontSize?.sp);
      case StyleKey.button:
        return themeData.labelLarge!.copyWith(fontSize: themeData.labelLarge?.fontSize?.sp);
      case StyleKey.overline:
        return themeData.labelSmall!.copyWith(fontSize: themeData.labelSmall?.fontSize?.sp);
    }
  }
}
