import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:fitflow/features/train/get_training_plan/data/repo/get_training_plan_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTrainingPlanDataProvider = Provider<GetTrainingPlanRepoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return GetTrainingPlanRepoData(database: database, supabase: supabase);
});
