import 'package:fitflow/features/general_providers/drift_app_database_provider.dart';
import 'package:fitflow/features/home/home_main_screen/data/repo/home_quotes_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final homeQuotesDataProvider = Provider<HomeQuotesRepo>((ref) {
  final database = ref.watch(localDatabaseProvider);
  return HomeQuotesRepo(database: database);
});
