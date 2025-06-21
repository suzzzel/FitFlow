import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/progress/data/repo/main_progress_repo_impl.dart';

class MainProgressRepo implements MainProgressRepoImpl {
  final AppDatabase database;
  final SupabaseClient supabase;
  MainProgressRepo({
    required this.database,
    required this.supabase,
  });

  @override
  Future<MainProgressModel?> getMainProgressAboutUser() async {
    int middlePercent = 0;
    int countOfReps = 0;
    List<TrainingDayClass> trainings = [];
    final idUser = supabase.auth.currentUser!.id;
    try {
      // can return empty if user dont do the at least one train
      final offlineTrainingsUser = await database.managers.trainingTable
          .filter((f) => f.idUser.equals(idUser))
          .get();
      try {
        final onlineTrainingsUser = await supabase
            .from('trainings_users')
            .select()
            .eq('idUser', idUser);
        if (offlineTrainingsUser.isEmpty) {
          for (var x in onlineTrainingsUser) {
            x.putIfAbsent('isChillday', () => false);
            final train = TrainingDayClass.fromMap(x);
            await database.managers.trainingTable.create((f) => f(
                idUser: train.idUser!,
                isTrainOver: Value(train.isTrainOver),
                dayOfTraining: train.dayOfTraining!,
                mainMuscle: Value(train.mainMuscle),
                exerciseOne: train.exerciseOne!,
                countRepsExOne: train.countRepsExOne!,
                maxWeightExOne: train.maxWeightExOne!,
                exerciseTwo: Value(train.exerciseTwo),
                countRepsExTwo: Value(train.countRepsExTwo),
                maxWeightExTwo: Value(train.maxWeightExTwo),
                exerciseThree: Value(train.exerciseThree),
                countRepsExThree: Value(train.countRepsExThree),
                maxWeightExThree: Value(train.maxWeightExThree),
                exerciseFour: Value(train.exerciseFour),
                countRepsExFour: Value(train.countRepsExFour),
                maxWeightExFour: Value(train.maxWeightExFour),
                exerciseFive: Value(train.exerciseFive),
                countRepsExFive: Value(train.countRepsExFive),
                maxWeightExFive: Value(train.maxWeightExFive),
                percentOfTrainDone: train.percentOfTrainDone ?? 0));
          }
        } else {
          if (offlineTrainingsUser.length < onlineTrainingsUser.length) {
            for (var y in onlineTrainingsUser) {
              try {
                offlineTrainingsUser.firstWhere(
                  (element) => element.dayOfTraining == y['dayOfTraining'],
                );
              } catch (e) {
                y.putIfAbsent('isChillday', () => false);
                final train = TrainingDayClass.fromMap(y);
                await database.managers.trainingTable.create((f) => f(
                    idUser: train.idUser!,
                    isTrainOver: Value(train.isTrainOver),
                    dayOfTraining: train.dayOfTraining!,
                    mainMuscle: Value(train.mainMuscle),
                    exerciseOne: train.exerciseOne!,
                    countRepsExOne: train.countRepsExOne!,
                    maxWeightExOne: train.maxWeightExOne!,
                    exerciseTwo: Value(train.exerciseTwo),
                    countRepsExTwo: Value(train.countRepsExTwo),
                    maxWeightExTwo: Value(train.maxWeightExTwo),
                    exerciseThree: Value(train.exerciseThree),
                    countRepsExThree: Value(train.countRepsExThree),
                    maxWeightExThree: Value(train.maxWeightExThree),
                    exerciseFour: Value(train.exerciseFour),
                    countRepsExFour: Value(train.countRepsExFour),
                    maxWeightExFour: Value(train.maxWeightExFour),
                    exerciseFive: Value(train.exerciseFive),
                    countRepsExFive: Value(train.countRepsExFive),
                    maxWeightExFive: Value(train.maxWeightExFive),
                    percentOfTrainDone: train.percentOfTrainDone ?? 0));
              }
            }
          } else {
            for (var j in offlineTrainingsUser) {
              middlePercent = middlePercent + j.percentOfTrainDone;
              countOfReps = countOfReps + j.countRepsExOne;
              countOfReps = countOfReps + (j.countRepsExTwo ?? 0);
              countOfReps = countOfReps + (j.countRepsExThree ?? 0);
              countOfReps = countOfReps + (j.countRepsExFour ?? 0);
              countOfReps = countOfReps + (j.countRepsExFive ?? 0);
              final train = j.toJson();
              train.putIfAbsent('isChillday', () => false);
              trainings.add(TrainingDayClass.fromMap(train));
            }
            final MainProgressModel data = MainProgressModel(
                countOfTrainings: offlineTrainingsUser.length,
                middlePercentOfTrainings:
                    middlePercent ~/ onlineTrainingsUser.length,
                countOfRepsAllTime: countOfReps,
                listOfTrainings: trainings);
            log(data.toString());
            return data;
          }
        }
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }

  @override
  Future<void> getProgressByDay(
      {required String idUser, required String date}) {
    // TODO: implement getProgressByDay
    throw UnimplementedError();
  }
}
