import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../feature/nearby_jobs/model/task_model.dart';
import '../../../feature/nearby_jobs/view_model/nearby_view_model.dart';
import '../../../feature/register/view_model/register_view_model.dart';

final registerProvider = ChangeNotifierProvider<RegisterViewModel>((ref) => RegisterViewModel());
final nearbyJobsModelProvider = StateNotifierProvider<NearbyViewModel, List<JobModel>>((ref) {
  return NearbyViewModel();
});
