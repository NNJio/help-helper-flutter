import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color.dart';
import 'label.dart';

Widget roleCard({
  required bool isUser,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16.r),
    child: Container(
      width: 140.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: isUser ? ColorConstants.userTheme : ColorConstants.helperTheme,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              isUser ? 'assets/images/user_role.png' : 'assets/images/helper_role.png',
              width: 100.w,
              height: 100.h,
            ),
            Label(
              isUser ? 'User' : 'Helper',
              fontSize: 27.sp,
              color: isUser ? ColorConstants.textTheme : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    ),
  );
}
