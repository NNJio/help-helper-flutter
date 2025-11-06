import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/enums.dart';
import 'custom_dialog.dart';
import 'label.dart';
import 'space.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key, this.onGoogleTap});

  final VoidCallback? onGoogleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _socialButton(
          iconAsset: 'assets/icons/google_logo_icon.png',
          color: Colors.white,
          onPressed: onGoogleTap ?? () {},
          text: 'Login with Google',
        ),
        addVerticalSpace(16.h),
        _socialButton(
          iconAsset: 'assets/icons/apple.png',
          color: Colors.white,
          onPressed: () => CustomDialog.showDialogs(
            context: context,
            title: 'ยังไม่เปิดใช้งานในตอนนี้',
            content: 'ระบบลงทะเบียนจะเปิดให้ใช้งานเร็ว ๆ นี้',
          ),
          text: 'Login with Apple',
        ),
      ],
    );
  }

  Widget _socialButton({
    IconData? icon,
    String? iconAsset,
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: 230.w,
        height: 36.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(icon, color: Colors.white, size: 28.sp)
                : Image.asset(
                    iconAsset!,
                    width: 28.w,
                    height: 28.w,
                  ),
            addHorizontalSpace(16.w),
            Label(
              text,
              styleKey: StyleKey.button,
            ),
          ],
        ),
      ),
    );
  }
}
