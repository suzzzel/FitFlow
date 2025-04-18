import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:fitflow/features/db/exercise_table.dart';
import 'package:fitflow/features/db/training_plan.dart';
import 'package:fitflow/features/db/training_table.dart';
import 'package:fitflow/features/db/user_table.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
    tables: [UserInfoTable, TrainingPlanTable, ExerciseTable, TrainingTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'local_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
