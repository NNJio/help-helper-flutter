import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/profile/view/profile_edits.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/push_page.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';
import 'package:help_helper/shared/utils/provider/provider.dart';

class ProfileDetailPage extends ConsumerWidget {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldCustoms(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Label(
          'ข้อมูลส่วนตัว',
          styleKey: StyleKey.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48.r,
                    backgroundImage: const NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                  ),
                  addVerticalSpace(12.h),
                  const Label('โปรไฟล์ของฉัน', styleKey: StyleKey.headline5),
                ],
              ),
            ),
            addVerticalSpace(24.h),
            Label('ชื่อ', fontSize: 14.sp),
            addVerticalSpace(6.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Label('Sabrina'),
            ),
            addVerticalSpace(16.h),
            Label('นามสกุล', fontSize: 14.sp),
            addVerticalSpace(6.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Label('Aryan'),
            ),
            addVerticalSpace(16.h),
            Label('เบอร์โทร', fontSize: 14.sp),
            addVerticalSpace(6.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Label('081-234-5678'),
            ),
            addVerticalSpace(16.h),
            Label('อีเมล', fontSize: 14.sp),
            addVerticalSpace(6.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Label('sabrina@example.com'),
            ),
            addVerticalSpace(80.h),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(editPasswordProvider.notifier).state = false;
                    go(context, const ProfileEditsPage());
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48.h)),
                  child: Label('แก้ไขข้อมูลส่วนตัว', fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              addHorizontalSpace(12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(editPasswordProvider.notifier).state = true;
                    go(context, const ProfileEditsPage());
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48.h)),
                  child: Label('แก้ไขรหัสผ่าน', fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
