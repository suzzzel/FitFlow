import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/data/repo/get_temp_week_progress_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTempWeekProgressDataProvider =
    Provider<GetTempWeekProgressRepoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return GetTempWeekProgressRepoData(database: database, supabase: supabase);
});
