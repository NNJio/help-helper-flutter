import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'label.dart';

class EarningsSummary extends StatelessWidget {
  const EarningsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Label('วันนี้', fontSize: 16.sp, color: Colors.white),
                SizedBox(height: 4.h),
                Label('5,000 ฿', fontSize: 20.sp, color: Colors.white),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          Container(width: 1.w, height: 48.h, color: Colors.white),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Label('เดือนนี้', fontSize: 16.sp, color: Colors.white),
                SizedBox(height: 4.h),
                Label('70,000 ฿', fontSize: 20.sp, color: Colors.white),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
