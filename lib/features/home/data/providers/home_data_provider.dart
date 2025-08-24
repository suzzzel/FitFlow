import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/home/data/repo/home_data_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeDataProvider = Provider<HomeDataRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return HomeDataRepo(database: database, supabase: supabase);
});
