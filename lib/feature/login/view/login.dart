// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/home/view/home.dart';
import 'package:help_helper/feature/otp/view/otp.dart';
import 'package:help_helper/feature/register/view/register.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/push_page.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/social_login_button.dart';
import 'package:help_helper/shared/componets/top_snackbar.dart';
import 'package:help_helper/shared/services/auth/google_auth.dart';
import 'package:help_helper/shared/theme/color.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldCustoms(
      appBar: AppBar(
        foregroundColor: ColorConstants.textTheme,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/user_role.png',
            width: 200.w,
            height: 200.h,
            fit: BoxFit.cover,
          ),
          const Label(
            'ยินดีต้อนรับ',
            styleKey: StyleKey.headline2,
            fontWeight: FontWeight.bold,
          ),
          Label(
            'เข้าสู่ระบบบัญชีของคุณ',
            // styleKey: StyleKey.bodyText1,
            fontSize: 16.sp,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(14.r),
              ),
              hintText: 'กรุณากรอกเบอร์โทรศัพท์',
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            ),
          ),
          InkWell(
            onTap: () => go(context, const OtpPage()),
            child: Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: ColorConstants.helperTheme,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: const Center(
                child: Label(
                  'Continue',
                  styleKey: StyleKey.bodyText1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              Label(
                'หรือ',
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          SocialLoginButtons(
            onGoogleTap: () async {
              try {
                final auth = AuthService();
                await auth.signInWithGoogle();
                go(context, const HomePage());
              } catch (e) {
                TopSnackbar.show(context, 'Google Sign-In ล้มเหลว: $e');
              }
            },
          ),
          Label(
            'Don\'t have an account?',
            fontSize: 16.sp,
          ),
          InkWell(
            onTap: () => go(context, const RegisterPage()),
            child: Label(
              'Register',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
