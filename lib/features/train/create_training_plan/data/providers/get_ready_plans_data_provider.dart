import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/train/create_training_plan/data/repo/create_training_plan_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getReadyPlansDataProvider = Provider<CreateTrainingPlanRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return CreateTrainingPlanRepo(database: database, supabase: supabase);
});
