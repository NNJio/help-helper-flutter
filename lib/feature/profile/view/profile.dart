// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/profile/view/profile_detail.dart';
import 'package:help_helper/feature/splash/view/splash.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/componets/top_snackbar.dart';
import 'package:help_helper/shared/services/auth/google_auth.dart';

import '../../../shared/componets/push_page.dart';
import '../../../shared/utils/constants/icon_text.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundImage: const NetworkImage(
                  'https://i.imgur.com/BoN9kdC.png',
                ),
              ),
              addHorizontalSpace(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label('Sabrina Aryan', fontSize: 20.sp, fontWeight: FontWeight.bold),
                  Label('สถานะสมาชิก : Helper', fontSize: 14.sp, color: Colors.black54),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: const Icon(Icons.star, color: Colors.amber),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          addVerticalSpace(24.h),
          buildMenuItem(
            icon: Icons.account_circle_outlined,
            title: 'ข้อมูลส่วนตัว',
            onTap: () => go(context, const ProfileDetailPage()),
          ),
          buildMenuItem(icon: Icons.paid_outlined, title: 'รายได้ของฉัน'),
          buildMenuItem(icon: Icons.workspace_premium_outlined, title: 'สมัครรับการเป็น helper'),
          buildMenuItem(icon: Icons.help_center_outlined, title: 'ศูนย์ความทนช่วยเหลือ'),
          buildMenuItem(icon: Icons.article_outlined, title: 'นโยบายความเป็นส่วนตัว'),
          Divider(thickness: 1, height: 32.h),
          buildMenuItem(icon: Icons.language, title: 'ภาษา'),
          buildMenuItem(icon: Icons.settings_outlined, title: 'การตั้งค่า'),
          buildMenuItem(
            icon: Icons.logout,
            title: 'ออกจากระบบ',
            onTap: () async {
              try {
                await AuthService().signOut();
                go(context, const SplashPage());
              } catch (e) {
                TopSnackbar.show(context, 'Sign Out ล้มเหลว: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
