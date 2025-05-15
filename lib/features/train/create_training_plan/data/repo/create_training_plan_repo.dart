// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/create_training_plan/data/repo/create_training_plan_repo_impl.dart';

class CreateTrainingPlanRepo implements CreateTrainingPlanRepoImpl {
  CreateTrainingPlanRepo({
    required this.database,
    required this.supabase,
  });

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<Map<int, List<ReadyTrainingPlanModel>>>
      getReadyTrainingPlansAndDownloadGifsEx() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final exFolderPath = '${appDir.path}/exGifs';
      await Directory(exFolderPath).create(recursive: true);
      final tempUser = await database.managers.userInfoTable.getSingle();
      final Map<int, List<ReadyTrainingPlanModel>> returnMap = {};
      List<Map<String, dynamic>> trainingPlansFromSupabase = await supabase
          .from('ready_training_plans')
          .select()
          .eq('level', tempUser.level)
          .eq('goal', tempUser.goal)
          .order('weekdayInt', ascending: true);
      if (trainingPlansFromSupabase.isEmpty) {
        trainingPlansFromSupabase = await supabase
            .from('ready_training_plans')
            .select()
            .order('weekdayInt', ascending: true);
      }
      for (var x in trainingPlansFromSupabase) {
        final tempIdTrain = x['idTrain'];
        final isThisTrainPlanExistInMap = returnMap.containsKey(tempIdTrain);
        for (int exercise = 0; exercise != 5; exercise++) {
          String tempEx = '';
          String tempExId = '';
          switch (exercise) {
            case 0:
              tempEx = 'exOne';
              tempExId = x['exOne'];
            case 1:
              tempEx = 'exTwo';
              tempExId = x['exTwo'] ?? '';
            case 2:
              tempEx = 'exThree';
              tempExId = x['exThree'] ?? '';
            case 3:
              tempEx = 'exFour';
              tempExId = x['exFour'] ?? '';
            case 4:
              tempEx = 'exFive';
              tempExId = x['exFive'] ?? '';
          }
          if (tempEx == '') {
            break;
          } else {
            try {
              tempExId = tempExId.padLeft(4, '0');
              if (tempExId != '0000') {
                final bool exGifInLocaleMemory =
                    await File('$exFolderPath/$tempExId.gif').exists();
                if (exGifInLocaleMemory) {
                  log('find in locale');
                } else {
                  log('go to online');
                  try {
                    final Uint8List gifFromOnline = await supabase.storage
                        .from('exercises.gifs')
                        .download('assets/$tempExId.gif');
                    final exGif = File('$exFolderPath/$tempExId.gif');
                    exGif.writeAsBytesSync(gifFromOnline);
                  } catch (e) {
                    log(e.runtimeType.toString());
                    // подумать над заглушкой
                  }
                }
              }
            } catch (e) {
              // dodymat
            }
          }
        }
        if (isThisTrainPlanExistInMap) {
          returnMap[tempIdTrain]!.add(ReadyTrainingPlanModel(
              idTrain: tempIdTrain,
              name: x['name'],
              level: x['level'],
              goal: x['goal'],
              weekday: x['weekday'],
              exOne: x['exOne'],
              exTwo: x['exTwo'],
              exThree: x['exThree'],
              exFour: x['exFour'],
              exFive: x['exFive'],
              mainMuscle: x['mainMuscle'],
              secondaryMuscle: x['secondaryMuscle'],
              reqReps: x['reqReps']));
        } else {
          final List<ReadyTrainingPlanModel> newList = [
            ReadyTrainingPlanModel(
                idTrain: tempIdTrain,
                name: x['name'],
                level: x['level'],
                goal: x['goal'],
                weekday: x['weekday'],
                exOne: x['exOne'],
                exTwo: x['exTwo'],
                exThree: x['exThree'],
                exFour: x['exFour'],
                exFive: x['exFive'],
                mainMuscle: x['mainMuscle'],
                secondaryMuscle: x['secondaryMuscle'],
                reqReps: x['reqReps'])
          ];
          returnMap.addAll({tempIdTrain: newList});
        }
      }
      // await getInfoExercises(trainingPlanId: '1');
      return returnMap;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ExerciseModel>> getInfoExercisesReadyPlan(
      {required String trainingPlanId}) async {
    final List<ExerciseModel> exList = [];
    try {
      final trainPlan = await supabase
          .from('ready_training_plans')
          .select()
          .eq('idTrain', trainingPlanId)
          .order('weekdayInt', ascending: true);
      // Отдельно каждый день
      final List<ReadyTrainingPlanModel> days = trainPlan
          .map((element) => ReadyTrainingPlanModel.fromMap(element))
          .toList();
      // Отдельно пройдем по упражнениям в каждом дне
      for (var day in days) {
        final listOfEx = [
          day.exOne,
          day.exTwo,
          day.exThree,
          day.exFour,
          day.exFive
        ];

        final List<Future<ExerciseModel>> futures =
            listOfEx.where((exId) => exId != null).map((exId) async {
          final exData = await supabase
              .from('exercises')
              .select()
              .eq('id', exId!)
              .single()
              .catchError((e) => log(e.toString()));
          return ExerciseModel.fromJson(exData);
        }).toList();

        final List<ExerciseModel> results = await Future.wait(futures);
        exList.addAll(results);
      }
      return exList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> confirmPlan(
      {required Map<String, List<ExerciseModel>> days}) async {
    try {
      final int currentWeekday = DateTime.now().weekday;
      final int daysToSubstract = currentWeekday - 1;
      final DateTime startOfWeek =
          DateTime.now().subtract(Duration(days: daysToSubstract));
      final statOfWeekFormatted =
          DateFormat('yyyy-MM-dd').format(startOfWeek).toString();
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
// TEST
        for (var y in exercises) {
          await database.managers.exerciseTable.create((ex) => ex(
                id: y.id.toString(),
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
// TEST
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
            idUser: supabase.auth.currentUser!.aud,
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
      log(e.runtimeType.toString());
      return false;
    }
  }
}
