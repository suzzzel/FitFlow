import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fitflow/features/progress/domain/models/exercises_into_day_model.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:path_provider/path_provider.dart';
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
  Future<List<ExercisesIntoDayModel>> getProgressByDay(
      {required TrainingDayClass dayOfTrain}) async {
    final List<ExercisesIntoDayModel> listToReturn = [];
    final appDirForPreloadGif = await getApplicationDocumentsDirectory();
    final exFolderPath = '${appDirForPreloadGif.path}/exGifs';
    final exercises = dayOfTrain.getExercise();
    for (int x = 0; x != exercises.length; x++) {
      int coutOfReps = 0;
      String maxWeight = '0';
      switch (x) {
        case 0:
          coutOfReps = dayOfTrain.countRepsExOne ?? 0;
          maxWeight = dayOfTrain.maxWeightExOne ?? '0';
          break;
        case 1:
          coutOfReps = dayOfTrain.countRepsExTwo ?? 0;
          maxWeight = dayOfTrain.maxWeightExTwo ?? '0';
          break;
        case 2:
          coutOfReps = dayOfTrain.countRepsExThree ?? 0;
          maxWeight = dayOfTrain.maxWeightExThree ?? '0';
          break;
        case 3:
          coutOfReps = dayOfTrain.countRepsExFour ?? 0;
          maxWeight = dayOfTrain.maxWeightExFour ?? '0';
          break;
        case 4:
          coutOfReps = dayOfTrain.countRepsExFive ?? 0;
          maxWeight = dayOfTrain.maxWeightExFive ?? '0';
          break;
      }
      try {
        final dataAboutExercise = await database.managers.exerciseTable
            .filter((f) => f.id.call(int.parse(exercises[x])))
            .limit(1)
            .getSingle();
        final String tempExIdToGif =
            dataAboutExercise.id.toString().padLeft(4, '0');
        final File exGifInLocaleMemory =
            File('$exFolderPath/$tempExIdToGif.gif');
        listToReturn.add(ExercisesIntoDayModel(
            exerciceName: dataAboutExercise.name,
            countOfReps: coutOfReps,
            maxWeight: maxWeight,
            gifExercise: exGifInLocaleMemory));
      } catch (e) {
        final dataAboutExercise = await supabase
            .from('exercises')
            .select()
            .eq('id', x)
            .onError((e, _) {
          throw e!;
        });
        final Uint8List gifFromOnline = await supabase.storage
            .from('exercises.gifs')
            .download(
                'assets/${dataAboutExercise.first['id'].toString().padLeft(4, '0')}.gif');
        final exGif = File(
            '$exFolderPath/${dataAboutExercise.first['id'].toString().padLeft(4, '0')}.gif');
        exGif.writeAsBytesSync(gifFromOnline);
        listToReturn.add(ExercisesIntoDayModel(
            exerciceName: dataAboutExercise.first['name'],
            countOfReps: coutOfReps,
            maxWeight: maxWeight,
            gifExercise: exGif));
      }
    }
    return listToReturn;
  }
}
