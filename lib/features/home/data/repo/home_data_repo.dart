// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';

import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/home/data/repo/home_data_impl.dart';

class HomeDataRepo implements HomeDataImpl {
  final AppDatabase database;
  final SupabaseClient supabase;

  HomeDataRepo({
    required this.database,
    required this.supabase,
  });

  @override
  Future<Map<String, List<ExerciseModel>>> getExerciseInTrainingPlan() async {
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
            final infoAboutExercise = await supabase
                .from('exercises')
                .select()
                .eq('id', exercise)
                .single();
            await database.managers.exerciseTable.create((f) => f(
                id: infoAboutExercise['id'],
                bodyPart: infoAboutExercise['bodyPart'],
                equipment: infoAboutExercise['equipment'],
                name: infoAboutExercise['name'],
                target: infoAboutExercise['target'],
                secondaryMuscleZero:
                    Value(infoAboutExercise['secondaryMuscle/0']),
                secondaryMuscleOne:
                    Value(infoAboutExercise['secondaryMuscle/1']),
                secondaryMuscleTwo:
                    Value(infoAboutExercise['secondaryMuscle/2']),
                secondaryMuscleThree:
                    Value(infoAboutExercise['secondaryMuscle/3']),
                secondaryMuscleFour:
                    Value(infoAboutExercise['secondaryMuscle/4']),
                secondaryMuscleFive:
                    Value(infoAboutExercise['secondaryMuscle/5']),
                instructionsZero: Value(infoAboutExercise['instructions/0']),
                instructionsOne: Value(infoAboutExercise['instructions/1']),
                instructionsTwo: Value(infoAboutExercise['instructions/2']),
                instructionsThree: Value(infoAboutExercise['instructions/3']),
                instructionsFour: Value(infoAboutExercise['instructions/4']),
                instructionsFive: Value(infoAboutExercise['instructions/5']),
                instructionsSix: Value(infoAboutExercise['instructions/6']),
                instructionsSeven: Value(infoAboutExercise['instructions/7']),
                instructionsEight: Value(infoAboutExercise['instructions/8']),
                instructionsNine: Value(infoAboutExercise['instructions/9']),
                instructionsTen: Value(infoAboutExercise['instructions/10'])));
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
                .add(ExerciseModel.fromJson(infoAboutExercise));
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
