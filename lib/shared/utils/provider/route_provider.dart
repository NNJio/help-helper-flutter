import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:help_helper/feature/nearby_jobs/model/task_model.dart';
import 'package:help_helper/feature/nearby_jobs/view_model/nearby_view_model.dart';
import 'package:help_helper/feature/register/view_model/register_view_model.dart';

// Register
final registerProvider = ChangeNotifierProvider<RegisterViewModel>(
  (ref) => RegisterViewModel(),
);

// Nearby Jobs
final nearbyJobsModelProvider = StateNotifierProvider<NearbyViewModel, List<JobModel>>(
  (ref) => NearbyViewModel(),
);

// OTP
// final otpViewModelProvider = StateNotifierProvider.autoDispose<OtpViewModel, OtpState>(
//   (ref) => OtpViewModel(ref),
// );
