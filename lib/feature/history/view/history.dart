import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/shared/componets/earning_sum.dart';

import '../../../shared/componets/history_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 16.h),

            /// Earnings Summary Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const EarningsSummary(),
            ),

            SizedBox(height: 24.h),

            /// History List Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('History', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (_, index) => const HistoryItem(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
