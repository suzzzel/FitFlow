// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/profile/data/repo/home_buttons/home_buttons_data_impl.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeButtonsRepo implements HomeButtonsDataImpl {
  final AppDatabase database;
  final SupabaseClient supabase;
  HomeButtonsRepo({
    required this.database,
    required this.supabase,
  });
  @override
  Future<bool> deletePlan() async {
    final user = supabase.auth.currentUser!;
    try {
      await supabase.from('training_plan_users').delete().eq('idUser', user.id);
      await database.managers.trainingPlanTable
          .filter((f) => f.idUser(user.id))
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> editTrainPlan(
      {required Map<String, List<ExerciseModel>> days}) async {
    try {
      final user = supabase.auth.currentUser!;
      final int currentWeekday = DateTime.now().weekday;
      final int daysToSubstract = currentWeekday - 1;
      final DateTime startOfWeek =
          DateTime.now().subtract(Duration(days: daysToSubstract));
      final statOfWeekFormatted =
          DateFormat('yyyy-MM-dd').format(startOfWeek).toString();
      // fully update train plan
      await database.managers.trainingPlanTable.delete();
      await supabase.from('training_plan_users').delete().eq('idUser', user.id);
      // fully update train plan
      for (var x in days.entries) {
        final String weekday = x.key;
        final List<ExerciseModel> exercises = x.value;
        final exIds = exercises.take(5).map((e) => e.id.toString()).toList();
        final exOne = exIds.isNotEmpty ? exIds[0] : null;
        final exTwo = exIds.length > 1 ? exIds[1] : null;
        final exThree = exIds.length > 2 ? exIds[2] : null;
        final exFour = exIds.length > 3 ? exIds[3] : null;
        final exFive = exIds.length > 4 ? exIds[4] : null;
        final mainMuscle = exercises.isNotEmpty ? exercises[0].target : null;
        final secondaryMuscles = exercises
            .expand((ex) => [
                  ex.secondaryMuscleZero,
                  ex.secondaryMuscleOne,
                  ex.secondaryMuscleTwo,
                  ex.secondaryMuscleThree,
                  ex.secondaryMuscleFour,
                  ex.secondaryMuscleFive,
                ])
            .whereType<String>()
            .join(', ');
        // load ex to locale
        for (var y in exercises) {
          final thisExerciseHasInLocale = await database.managers.exerciseTable
              .filter((f) => f.id.equals(y.id))
              .limit(1)
              .getSingleOrNull();
          if (thisExerciseHasInLocale != null) {
            continue;
          } else {
            await database.managers.exerciseTable.create((ex) => ex(
                  id: y.id,
                  bodyPart: y.bodyPart,
                  equipment: y.equipment,
                  name: y.name,
                  target: y.target,
                  secondaryMuscleZero: Value(y.secondaryMuscleZero),
                  secondaryMuscleOne: Value(y.secondaryMuscleOne),
                  secondaryMuscleTwo: Value(y.secondaryMuscleTwo),
                  secondaryMuscleThree: Value(y.secondaryMuscleThree),
                  secondaryMuscleFour: Value(y.secondaryMuscleFour),
                  secondaryMuscleFive: Value(y.secondaryMuscleFive),
                  instructionsZero: Value(y.instructionsZero),
                  instructionsOne: Value(y.instructionsOne),
                  instructionsTwo: Value(y.instructionsTwo),
                  instructionsThree: Value(y.instructionsThree),
                  instructionsFour: Value(y.instructionsFour),
                  instructionsFive: Value(y.instructionsFive),
                  instructionsSix: Value(y.instructionsSix),
                  instructionsSeven: Value(y.instructionsSeven),
                  instructionsEight: Value(y.instructionsEight),
                  instructionsNine: Value(y.instructionsNine),
                  instructionsTen: Value(y.instructionsTen),
                ));
          }
        }
        // load ex to locale
        await database.managers.trainingPlanTable.create((element) => element(
            dataCreatingPlan: statOfWeekFormatted,
            dayOfWeek: weekday,
            exerciseOne: exOne!,
            exerciseTwo: Value(exTwo),
            exerciseThree: Value(exThree),
            exerciseFour: Value(exFour),
            exerciseFive: Value(exFive),
            mainMuscle: Value(mainMuscle),
            secondaryMuscle: Value(secondaryMuscles),
            idUser: supabase.auth.currentUser!.id,
            reqReps: '20'));
        final tempDay = TrainingPlanClass(
            idUser: supabase.auth.currentUser!.id,
            dayOfWeek: weekday,
            exerciseOne: exOne!,
            exerciseTwo: exTwo,
            exerciseThree: exThree,
            exerciseFour: exFour,
            exerciseFive: exFive,
            mainMuscle: mainMuscle,
            secondaryMuscle: secondaryMuscles,
            reqReps: '20',
            dataCreatingPlan: statOfWeekFormatted);
        await supabase.from('training_plan_users').insert(tempDay.toMap());
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, List<ExerciseModel>>> getTempTrainPlan() async {
    try {
      final Map<String, List<ExerciseModel>> returnedPlan = {};
      final offlinePlan = await database.managers.trainingPlanTable.get();
      for (var dayOfWeek in offlinePlan) {
        List<String> exerciseNeedToLoad = [];
        final exerciseInTempDayOfWeek = [
          dayOfWeek.exerciseOne,
          dayOfWeek.exerciseTwo,
          dayOfWeek.exerciseThree,
          dayOfWeek.exerciseFour,
          dayOfWeek.exerciseFive,
        ];
        for (var x in exerciseInTempDayOfWeek) {
          if (x == null) {
            continue;
          } else {
            exerciseNeedToLoad.add(x);
          }
        }
        for (var exercise in exerciseNeedToLoad) {
          final exerciseInfo = await database.managers.exerciseTable
              .filter((f) => f.id.equals(int.parse(exercise)))
              .limit(1)
              .getSingleOrNull();
          if (exerciseInfo == null) {
            final infoAboutExercise =
                await supabase.from('exercises').select().eq('id', exercise);
            final appDirForPreloadGif =
                await getApplicationDocumentsDirectory();
            final exFolderPath = '${appDirForPreloadGif.path}/exGifs';
            await Directory(exFolderPath).create(recursive: true);
            final gifName = exercise.padLeft(4, '0');
            final Uint8List gifFromOnline = await supabase.storage
                .from('exercises.gifs')
                .download('assets/$gifName.gif');
            final exGif = File('$exFolderPath/$gifName.gif');
            exGif.writeAsBytesSync(gifFromOnline);
            returnedPlan
                .putIfAbsent(dayOfWeek.dayOfWeek, () => [])
                .add(ExerciseModel.fromJson(infoAboutExercise.first));
          } else {
            returnedPlan
                .putIfAbsent(dayOfWeek.dayOfWeek, () => [])
                .add(ExerciseModel.fromJson(exerciseInfo.toJson()));
          }
        }
      }
      return returnedPlan;
    } catch (e) {
      rethrow;
    }
  }
}
