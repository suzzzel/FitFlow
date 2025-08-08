import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/profile/data/repo/home_buttons/home_buttons_data_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeButtonsDataProvider = Provider<HomeButtonsRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return HomeButtonsRepo(database: database, supabase: supabase);
});
