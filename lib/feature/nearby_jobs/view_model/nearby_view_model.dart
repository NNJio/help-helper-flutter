import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/task_model.dart';

class NearbyViewModel extends StateNotifier<List<JobModel>> {
  NearbyViewModel() : super(_initialJobs);

  static final List<JobModel> _initialJobs = [
    JobModel(
      type: 'หาช่าง',
      time: 'ทันที',
      date: '29 ต.ค. 2568 04:46',
      location: '88G4+MPC 3 ต.บ่อกวางทอง อ.บ่อทอง ชลบุรี',
      price: '1,000 ฿',
      status: 'ว่าง',
      icon: '🛠️',
      isAvailable: true,
    ),
    JobModel(
      type: 'หานักสืบ',
      time: 'ทันที',
      date: '01 พ.ย. 2568 04:19',
      location: 'ป้ายรถเมล์ ถ.รัชดาภิเษก คลองเตย กทม.',
      price: '200 ฿',
      status: 'helper รับงานแล้ว',
      icon: '🕵️‍♂️',
      isAvailable: false,
    ),
    JobModel(
      type: 'จ้างทั่วไป',
      time: 'ทันที',
      date: '01 พ.ย. 2568 00:13',
      location: 'ถ.ประเสริฐมนูกิจ เขตบึงกุ่ม กทม.',
      price: '45 ฿',
      status: 'helper รับงานแล้ว',
      icon: '👩‍💼',
      isAvailable: false,
    ),
  ];

  void markJobTaken(int index) {
    final job = state[index];
    final updated = job.copyWith(
      status: 'helper รับงานแล้ว',
      isAvailable: false,
    );

    state = [...state]..[index] = updated;
  }
}

extension on JobModel {
  JobModel copyWith({
    String? type,
    String? time,
    String? date,
    String? location,
    String? price,
    String? status,
    String? icon,
    bool? isAvailable,
  }) {
    return JobModel(
      type: type ?? this.type,
      time: time ?? this.time,
      date: date ?? this.date,
      location: location ?? this.location,
      price: price ?? this.price,
      status: status ?? this.status,
      icon: icon ?? this.icon,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
