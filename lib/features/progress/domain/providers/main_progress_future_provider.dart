import 'package:fitflow/features/progress/data/providers/main_progress_data_provider.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/repo/main_progress_domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getMainProgressProvider =
    FutureProvider.autoDispose<MainProgressModel>((ref) async {
  final dataRepo = ref.watch(mainProgressDataProvider);
  final domainProv = MainProgressDomain(dataRepo: dataRepo);
  return await domainProv.getMainProgress();
  // return MainProgressModel.empty();
});
