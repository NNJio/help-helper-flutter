import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';

import '../../../shared/utils/provider/provider.dart';

class ProfileEditsPage extends ConsumerWidget {
  const ProfileEditsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editPassword = ref.watch(editPasswordProvider);
    bool isEditPassword = editPassword == true;

    return ScaffoldCustoms(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Label(isEditPassword ? 'แก้ไขรหัสผ่าน' : 'แก้ไขข้อมูลส่วนตัว', styleKey: StyleKey.headline6),
      ),
      body: SingleChildScrollView(
        child: isEditPassword
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label('รหัสผ่านเก่า', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'กรอกรหัสผ่านเก่า',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                  addVerticalSpace(16.h),
                  Label('รหัสผ่านใหม่', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'กรอกรหัสผ่านใหม่',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                  addVerticalSpace(16.h),
                  Label('ยิืนยันรหัสผ่านใหม่', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'กรอกรหัสผ่านใหม่',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 48.r,
                      backgroundImage: const NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                    ),
                  ),
                  addVerticalSpace(24.h),
                  Label('ชื่อ', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'กรอกชื่อ',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                  addVerticalSpace(16.h),
                  Label('นามสกุล', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'กรอกนามสกุล',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                  addVerticalSpace(16.h),
                  Label('เบอร์โทร', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'กรอกเบอร์โทร',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
                  ),
                  addVerticalSpace(16.h),
                  Label('อีเมล', fontSize: 14.sp),
                  addVerticalSpace(8.h),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'กรอกอีเมล',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    ),
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
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48.h)),
                  child: const Label('บันทึก', styleKey: StyleKey.button),
                ),
              ),
              addHorizontalSpace(12.w),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 48.h)),
                  child: Label('ยกเลิก', fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
