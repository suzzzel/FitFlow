import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/get_temp_week_progress/data/repo/get_temp_week_progress_repo_impl.dart';
import 'package:fitflow/features/train/get_temp_week_progress/domain/models/training_day_class.dart';

class GetTempWeekProgressRepoData implements GetTempWeekProgressRepoImpl {
  GetTempWeekProgressRepoData({
    required this.database,
    required this.supabase,
  });

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<List<TrainingDayClass>> getTempWeekTrainings() async {
    final int currentWeekday = DateTime.now().weekday;
    final int daysToSubstract = currentWeekday - 1;
    final DateTime startOfWeek =
        DateTime.now().subtract(Duration(days: daysToSubstract));

    try {
      final List<TrainingDayClass> offlineTrainings = [];
      for (int x = 0; x != currentWeekday; x++) {
        final dayToFind =
            DateFormat('yyyy-MM-dd').format(startOfWeek.add(Duration(days: x)));
        final trainDay = await database.managers.trainingTable
            .filter((day) => day.dayOfTraining(dayToFind))
            .getSingleOrNull();
        if (trainDay == null) {
          continue;
        } else {
          offlineTrainings
              .add(TrainingDayClass.fromJson(trainDay.toJsonString()));
          continue;
        }
      }
      for (var x in offlineTrainings) {
        log(x.toString());
      }
      return offlineTrainings;
    } catch (e) {
      rethrow;
    }
    // try {
    //   await database.managers.trainingTable.create((f) => f(
    //       dayOfTraining: '2025-03-19',
    //       exerciseOne: '112',
    //       countRepsExOne: 5,
    //       maxWeightExOne: '110',
    //       percentOfTrainDone: 25,
    //       idUser: 'test'));
    //   // await database.managers.trainingTable.delete();
    //   return [];
    // } catch (e) {
    //   rethrow;
    // }
  }
}
