import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/train/get_today_train_info/data/repo/get_today_train_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geTodayTrainInfoDataProvider = Provider<GetTodayTrainInfoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return GetTodayTrainInfoData(database: database, supabase: supabase);
});
