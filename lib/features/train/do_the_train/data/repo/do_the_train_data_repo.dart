// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/train/do_the_train/data/repo/do_the_train_data_repo_impl.dart';

class DoTheTrainDataRepo implements DoTheTrainDataRepoImpl {
  final AppDatabase database;
  final SupabaseClient supabase;

  DoTheTrainDataRepo({
    required this.database,
    required this.supabase,
  });

  @override
  Future<ExerciseModel> getTempExercise(
      {required String tempExerciseId}) async {
    try {
      var exercise = await database.managers.exerciseTable
          .filter((f) => f.id(int.parse(tempExerciseId)))
          .getSingle();
      return ExerciseModel(
        id: exercise.id,
        bodyPart: exercise.bodyPart,
        equipment: exercise.bodyPart,
        name: exercise.name,
        target: exercise.target,
        secondaryMuscleZero: exercise.secondaryMuscleZero,
        secondaryMuscleOne: exercise.secondaryMuscleOne,
        secondaryMuscleTwo: exercise.secondaryMuscleTwo,
        secondaryMuscleThree: exercise.secondaryMuscleThree,
        secondaryMuscleFour: exercise.secondaryMuscleFour,
        secondaryMuscleFive: exercise.secondaryMuscleFive,
        instructionsZero: exercise.instructionsZero,
        instructionsOne: exercise.instructionsOne,
        instructionsTwo: exercise.instructionsTwo,
        instructionsThree: exercise.instructionsThree,
        instructionsFour: exercise.instructionsFour,
        instructionsFive: exercise.instructionsFive,
        instructionsSix: exercise.instructionsSix,
        instructionsSeven: exercise.instructionsSeven,
        instructionsEight: exercise.instructionsEight,
        instructionsNine: exercise.instructionsNine,
        instructionsTen: exercise.instructionsTen,
      );
    } catch (e) {
      final exercisesFromSP = await supabase
          .from('exercises')
          .select()
          .eq('id', tempExerciseId)
          .single();
      await database.managers.exerciseTable.create((f) => f(
          id: exercisesFromSP['id'],
          bodyPart: exercisesFromSP['bodyPart'],
          equipment: exercisesFromSP['equipment'],
          name: exercisesFromSP['name'],
          target: exercisesFromSP['target'],
          secondaryMuscleZero: Value(exercisesFromSP['secondaryMuscle/0']),
          secondaryMuscleOne: Value(exercisesFromSP['secondaryMuscle/1']),
          secondaryMuscleTwo: Value(exercisesFromSP['secondaryMuscle/2']),
          secondaryMuscleThree: Value(exercisesFromSP['secondaryMuscle/3']),
          secondaryMuscleFour: Value(exercisesFromSP['secondaryMuscle/4']),
          secondaryMuscleFive: Value(exercisesFromSP['secondaryMuscle/5']),
          instructionsZero: Value(exercisesFromSP['instructions/0']),
          instructionsOne: Value(exercisesFromSP['instructions/1']),
          instructionsTwo: Value(exercisesFromSP['instructions/2']),
          instructionsThree: Value(exercisesFromSP['instructions/3']),
          instructionsFour: Value(exercisesFromSP['instructions/4']),
          instructionsFive: Value(exercisesFromSP['instructions/5']),
          instructionsSix: Value(exercisesFromSP['instructions/6']),
          instructionsSeven: Value(exercisesFromSP['instructions/7']),
          instructionsEight: Value(exercisesFromSP['instructions/8']),
          instructionsNine: Value(exercisesFromSP['instructions/9']),
          instructionsTen: Value(exercisesFromSP['instructions/10'])));
      return ExerciseModel.fromJson(exercisesFromSP);
    }
  }

  @override
  Future<bool> saveTrainEndExit({required TempTrainModel train}) async {
    final dayOfTrain =
        '${train.dayOfTraining.year}-${train.dayOfTraining.month.toString().padLeft(2, '0')}-${train.dayOfTraining.day.toString().padLeft(2, '0')}';
    try {
      const localSecureStorage = FlutterSecureStorage();
      await localSecureStorage.write(key: 'isTrainGo', value: 'false');
      await database.managers.trainingTable
          .filter((f) => f.dayOfTraining.equals(dayOfTrain))
          .update((o) => o(
                idUser: Value(train.idUser),
                dayOfTraining: Value(dayOfTrain),
                exerciseOne: Value(train.exerciseOne),
                countRepsExOne: Value(train.countRepsExOne ?? 0),
                maxWeightExOne: Value(train.maxWeightExOne ?? '0'),
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
                percentOfTrainDone: Value(train.percentOfTrainDone() ?? 0),
                isTrainOver: const Value(true),
              ));
      try {
        await supabase.from('trainings_users').insert({
          'idUser': train.idUser,
          'dayOfTraining': train.dayOfTraining.toString(),
          'mainMuscle': train.mainMuscle,
          'exerciseOne': train.exerciseOne,
          'countRepsExOne': train.countRepsExOne ?? 0,
          'maxWeightExOne': train.maxWeightExOne ?? '0',
          'exerciseTwo': train.exerciseTwo,
          'countRepsExTwo': train.countRepsExTwo,
          'maxWeightExTwo': train.maxWeightExTwo,
          'exerciseThree': train.exerciseThree,
          'countRepsExThree': train.countRepsExThree,
          'maxWeightExThree': train.maxWeightExThree,
          'exerciseFour': train.exerciseFour,
          'countRepsExFour': train.countRepsExFour,
          'maxWeightExFour': train.maxWeightExFour,
          'exerciseFive': train.exerciseFive,
          'countRepsExFive': train.countRepsExFive,
          'maxWeightExFive': train.maxWeightExFive,
          'percentOfTrainDone': train.percentOfTrainDone(),
          'isTrainOver': true
        });
      } catch (e) {
        // will be saved in online when connected
        return true;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> nextExercise({required TempTrainModel train}) async {
    final dayOfTraining =
        '${train.dayOfTraining.year}-${train.dayOfTraining.month.toString().padLeft(2, '0')}-${train.dayOfTraining.day.toString().padLeft(2, '0')}';
    await database.managers.trainingTable
                .filter((item) => item.dayOfTraining.equals(dayOfTraining))
                .getSingleOrNull() !=
            null
        ? await database.managers.trainingTable
            .filter((item) => item.dayOfTraining.equals(dayOfTraining))
            .update((o) => o(
                  exerciseOne: Value(train.exerciseOne),
                  countRepsExOne: Value(train.countRepsExOne ?? 0),
                  maxWeightExOne: Value(train.maxWeightExOne ?? '0'),
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
                ))
        : await database.managers.trainingTable.create((f) => f(
              idUser: train.idUser,
              dayOfTraining:
                  '${train.dayOfTraining.year}-${train.dayOfTraining.month.toString().padLeft(2, '0')}-${train.dayOfTraining.day.toString().padLeft(2, '0')}',
              exerciseOne: train.exerciseOne,
              countRepsExOne: train.countRepsExOne ?? 0,
              maxWeightExOne: train.maxWeightExOne ?? '0',
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
              percentOfTrainDone: train.percentOfTrainDone() ?? 0,
              isTrainOver: train.tempExercise >= train.getExercise().length
                  ? const Value(true)
                  : const Value(false),
            ));
    final all = await database.managers.trainingTable.get();
    for (var x in all) {
      log(x.dayOfTraining);
    }
  }

  @override
  Future<bool> exitFromTrainWithoutSave() async {
    final dateNow = DateTime.now();
    final dayOfTraining =
        '${dateNow.year}-${dateNow.month.toString().padLeft(2, '0')}-${dateNow.day.toString().padLeft(2, '0')}';
    try {
      const localSecureStorage = FlutterSecureStorage();
      await database.managers.userInfoTable
          .update((f) => f(isTrainGo: const Value(false)));
      await database.managers.trainingTable
          .filter((f) => f.dayOfTraining(dayOfTraining))
          .delete();
      await localSecureStorage.write(key: 'isTrainGo', value: 'false');
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> startTrain() async {
    const localSecureStorage = FlutterSecureStorage();
    await localSecureStorage.write(key: 'isTrainGo', value: 'true');
  }

  @override
  Future<List<ExerciseModel>> getProgressTempTrain(
      {required List<String> exercisesList}) async {
    List<ExerciseModel> listToReturn = [];
    for (var exerciseToFind in exercisesList) {
      final tempEx = await getTempExercise(tempExerciseId: exerciseToFind);
      listToReturn.add(tempEx);
    }
    log('end get ex info');
    return listToReturn;
  }

  @override
  Future<void> exitFromTrainWhenTrainIsOver() async {
    const localSecureStorage = FlutterSecureStorage();
    await localSecureStorage.write(key: 'isTrainGo', value: 'false');
  }
}
