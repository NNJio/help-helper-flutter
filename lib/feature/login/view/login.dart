// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/home/view/home.dart';
import 'package:help_helper/feature/otp/view/otp.dart';
import 'package:help_helper/shared/componets/custom_dialog.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/push_page.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/social_login_button.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/componets/top_snackbar.dart';
import 'package:help_helper/shared/services/auth/google_auth.dart';
import 'package:help_helper/shared/theme/color.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';

import '../../../shared/utils/provider/provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final phoneController = TextEditingController();
    return ScaffoldCustoms(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(20.h),
          Image.asset(
            'assets/images/helper_role.png',
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
          Form(
            key: formKey,
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกเบอร์โทรศัพท์';
                } else if (value.length < 9 || value.length > 10) {
                  return 'กรุณากรอกเบอร์โทรศัพท์ให้ครบ 10 หลัก';
                } else if (!value.startsWith('0')) {
                  return 'เบอร์โทรต้องขึ้นต้นด้วย 0';
                }
                return null;
              },
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: Colors.white,
                hintText: 'กรุณากรอกเบอร์โทรศัพท์',
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),

                // ✅ border ปกติ (ไม่มี focus / error)
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14.r),
                ),

                // ✅ border ตอน focus
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorConstants.helperTheme, width: 1.5),
                  borderRadius: BorderRadius.circular(14.r),
                ),

                // ✅ border ตอน error
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(14.r),
                ),

                // ✅ border ตอน error + focus พร้อมกัน
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (!formKey.currentState!.validate()) {
                return;
              }

              final phoneNumber = '+66' + phoneController.text.substring(1);
              ref.read(currentPhoneProvider.notifier).state = phoneNumber;
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: phoneNumber,
                verificationCompleted: (PhoneAuthCredential credential) async {
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  ref.read(authMethodProvider.notifier).state = 'Phone';
                  go(context, const HomePage());
                },
                verificationFailed: (FirebaseAuthException e) {
                  TopSnackbar.show(context, 'ส่ง OTP ไม่สำเร็จ: ${e.message}');
                },
                codeSent: (String verificationId, int? resendToken) {
                  ref.read(otpVerifyIdProvider.notifier).state = verificationId;
                  ref.read(authMethodProvider.notifier).state = 'Phone';
                  go(context, const OtpPage());
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
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
                ref.read(authMethodProvider.notifier).state = 'Google';
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
            // onTap: () => go(context, const RegisterPage()), //! เปิดหน้า Register
            onTap: () => CustomDialog.showDialogs(
              context: context,
              title: 'ยังไม่เปิดใช้งานในตอนนี้',
              content: 'ระบบลงทะเบียนจะเปิดให้ใช้งานเร็ว ๆ นี้',
            ),
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
