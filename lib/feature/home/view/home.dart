import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/history/view/history.dart';
import 'package:help_helper/feature/nearby_jobs/view/nearby_jobs.dart';
import 'package:help_helper/feature/profile/view/profile.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Label(
              'ยินดีต้อนรับ',
              styleKey: StyleKey.headline5,
            ),
            addVerticalSpace(12.h),
            const Label(
              'ล็อกอินสำเร็จด้วย Google Sign In',
              styleKey: StyleKey.bodyText2,
            ),
          ],
        ),
      ),
      const HistoryPage(),
      const NearbyJobsPage(),
      const ProfilePage(),
    ];

    // ✅ สร้าง BottomNavigationBarItem ให้ตรงกัน
    final navItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      const BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
      const BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    ];

    // ✅ ป้องกัน index เกิน (เช่น toggle role ไปมา)
    final safeIndex = _currentIndex >= pages.length ? 0 : _currentIndex;

    return ScaffoldCustoms(
      body: pages[safeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: safeIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: navItems,
      ),
    );
  }
}
