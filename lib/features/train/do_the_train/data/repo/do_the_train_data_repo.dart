// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
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
      final exercise = await database.managers.exerciseTable
          .filter((f) => f.id(int.parse(tempExerciseId)))
          .getSingle();
      return ExerciseModel(
        id: exercise.id,
        bodyPart: exercise.bodyPart,
        equipment: exercise.bodyPart,
        name: exercise.name,
        target: exercise.name,
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
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> saveTrain({required TempTrainModel train}) async {
    try {
      await database.managers.trainingTable.create((f) => f(
            idUser: train.idUser,
            dayOfTraining: train.dayOfTraining.toString(),
            exerciseOne: train.exerciseOne,
            countRepsExOne: 2,
            maxWeightExOne: '100',
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
            percentOfTrainDone: 100,
          ));
      await supabase.from('trainings_users').insert({
        'idUser': train.idUser,
        'dayOfTraining': train.dayOfTraining.toString(),
        'mainMuscle': train.mainMuscle,
        'exerciseOne': train.exerciseOne,
        'countRepsExOne': 2,
        'maxWeightExOne': 100,
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
        'percentOfTrainDone': 100
      });
    } catch (e) {
      rethrow;
    }
  }
}
