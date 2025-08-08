// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ExercisesIntoDayModel {
  String exerciceName;
  int countOfReps;
  String maxWeight;
  File gifExercise;
  ExercisesIntoDayModel(
      {required this.exerciceName,
      required this.countOfReps,
      required this.maxWeight,
      required this.gifExercise});
}
