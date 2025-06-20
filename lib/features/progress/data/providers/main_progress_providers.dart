import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
import 'package:fitflow/features/progress/data/repo/main_progress_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getMainProgressProvider = FutureProvider<void>((ref) async {
  final database = ref.watch(localDatabaseProvider);
  final supabase = ref.watch(supabaseProvider);
  final dataRepo = MainProgressRepo(database: database, supabase: supabase);
  return await dataRepo.getMainProgressAboutUser(
      idUser: supabase.auth.currentUser!.id);
});
