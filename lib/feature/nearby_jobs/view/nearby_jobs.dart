import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_helper/shared/utils/provider/route_provider.dart';

import '../../../shared/componets/scaffold_customs.dart';
import '../model/task_model.dart';

class NearbyJobsPage extends ConsumerStatefulWidget {
  const NearbyJobsPage({super.key});

  @override
  ConsumerState<NearbyJobsPage> createState() => _NearbyJobsPageState();
}

class _NearbyJobsPageState extends ConsumerState<NearbyJobsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jobs = ref.watch(nearbyJobsModelProvider);

    return ScaffoldCustoms(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('ภารกิจ', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        // foregroundColor: Colors.black,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: 'งานด่วน'),
            Tab(text: 'งานล่วงหน้า'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildJobList(jobs),
          const Center(child: Text('ยังไม่มีงานล่วงหน้า')),
        ],
      ),
    );
  }

  Widget _buildJobList(List<JobModel> jobs) {
    return ListView.separated(
      itemCount: jobs.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        final job = jobs[index];
        return GestureDetector(
          onTap: () {
            if (job.isAvailable) {
              ref.read(nearbyJobsModelProvider.notifier).markJobTaken(index);
            }
          },
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(job.icon, style: TextStyle(fontSize: 24.sp)),
                    SizedBox(width: 8.w),
                    Text(job.type, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text(job.price, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8.h),
                Text('เวลา : ${job.time}\n${job.date}'),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 18),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(job.location, style: TextStyle(fontSize: 13.sp)),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: job.isAvailable ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      job.status,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
