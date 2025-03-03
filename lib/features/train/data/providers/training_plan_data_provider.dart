import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:fitflow/features/train/data/repo/training_plan_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trainingPlanDataProvider = Provider<TrainingPlanRepoData>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return TrainingPlanRepoData(database: database, supabase: supabase);
});
