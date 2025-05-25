import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/data/repo/get_temp_week_progress_repo_impl.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';

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
    final List<TrainingDayClass> listTrainingsOfWeek = [];

    try {
      final trainPlan = await database.managers.trainingPlanTable.get();
      log(DateTime.parse(trainPlan[0].dataCreatingPlan)
          .millisecondsSinceEpoch
          .toString());
      if (DateTime.now().millisecondsSinceEpoch <
          DateTime.parse(trainPlan[0].dataCreatingPlan)
              .millisecondsSinceEpoch) {
        return [];
      }
      final allExercise = await database.managers.exerciseTable.get();
      for (var x in allExercise) {
        log(x.toString());
      }
      for (int x = 0; x != currentWeekday; x++) {
        final dayToFind =
            DateFormat('yyyy-MM-dd').format(startOfWeek.add(Duration(days: x)));
        final String weekDayThisDayStringVersion =
            DateFormat('EEEE').format(DateTime.parse(dayToFind)).toLowerCase();
        final trainDay = await database.managers.trainingTable
            .filter((day) => day.dayOfTraining(dayToFind))
            .getSingleOrNull();
        final isThisWorkdayOrChillday = trainPlan
            .any((element) => element.dayOfWeek == weekDayThisDayStringVersion);
        final isTodayATrainAndIsAlreadyExist =
            dayToFind == DateFormat('yyyy-MM-dd').format(DateTime.now()) &&
                trainDay?.percentOfTrainDone == null;
        if (isTodayATrainAndIsAlreadyExist) {
          continue;
        } else {
          listTrainingsOfWeek.add(TrainingDayClass(
              isChillday: !isThisWorkdayOrChillday,
              dayOfTraining: trainDay?.dayOfTraining,
              mainMuscle: trainDay?.mainMuscle,
              idUser: trainDay?.idUser,
              exerciseOne: trainDay?.exerciseOne,
              exerciseTwo: trainDay?.exerciseTwo,
              exerciseThree: trainDay?.exerciseThree,
              exerciseFour: trainDay?.exerciseFour,
              exerciseFive: trainDay?.exerciseFive,
              countRepsExOne: trainDay?.countRepsExOne,
              countRepsExTwo: trainDay?.countRepsExTwo,
              countRepsExThree: trainDay?.countRepsExThree,
              countRepsExFour: trainDay?.countRepsExFour,
              countRepsExFive: trainDay?.countRepsExFive,
              maxWeightExOne: trainDay?.maxWeightExOne,
              maxWeightExTwo: trainDay?.maxWeightExTwo,
              maxWeightExThree: trainDay?.maxWeightExThree,
              maxWeightExFour: trainDay?.maxWeightExFour,
              maxWeightExFive: trainDay?.maxWeightExFive,
              percentOfTrainDone: trainDay?.percentOfTrainDone));
        }
      }
      await checkTrainingsDayInSupabase();
      return listTrainingsOfWeek;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> checkTrainingsDayInSupabase() async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final trainingsFromOnline =
          await supabase.from('trainings_users').select().eq('idUser', userId);
      final trainingsFromOffline = await database.managers.trainingTable.get();
      for (var x in trainingsFromOffline) {
        if (x.idUser == userId) {
          try {
            trainingsFromOnline.firstWhere((train) =>
                train['dayOfTraining'].toString() == x.dayOfTraining);
          } catch (e) {
            await supabase.from('trainings_users').insert(x.toJson());
            break;
          }
        }
      }
    } catch (e) {
      log('error');
      rethrow;
    }
  }
}
