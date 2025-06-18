import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/train/do_the_train/data/repo/do_the_train_data_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doTheTrainDataProvider = Provider<DoTheTrainDataRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  return DoTheTrainDataRepo(database: database, supabase: supabase);
});
