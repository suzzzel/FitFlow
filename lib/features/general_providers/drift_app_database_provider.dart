import 'package:fitflow/features/db/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
