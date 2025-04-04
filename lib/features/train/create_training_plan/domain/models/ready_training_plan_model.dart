// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ReadyTrainingPlanModel {
  final int idTrain;
  final String name;
  final String level;
  final String goal;
  final String weekday;
  final String exOne;
  final String? exTwo;
  final String? exThree;
  final String? exFour;
  final String? exFive;
  final File? exGif;
  final int reqReps;

  ReadyTrainingPlanModel({
    required this.idTrain,
    required this.name,
    required this.level,
    required this.goal,
    required this.weekday,
    required this.exOne,
    this.exTwo,
    this.exThree,
    this.exFour,
    this.exFive,
    this.exGif,
    required this.reqReps,
  });
  @override
  String toString() {
    return 'ReadyTrainingPlanModel(idTrain: $idTrain, name: $name, level: $level, goal: $goal, weekday: $weekday, exOne: $exOne, exTwo: $exTwo, exThree: $exThree, exFour: $exFour, exFive: $exFive, exGif: $exGif, reqReps: $reqReps)';
  }

  ReadyTrainingPlanModel copyWith({
    int? idTrain,
    String? name,
    String? level,
    String? goal,
    String? weekday,
    String? exOne,
    String? exTwo,
    String? exThree,
    String? exFour,
    String? exFive,
    File? exGif,
    int? reqReps,
  }) {
    return ReadyTrainingPlanModel(
      idTrain: idTrain ?? this.idTrain,
      name: name ?? this.name,
      level: level ?? this.level,
      goal: goal ?? this.goal,
      weekday: weekday ?? this.weekday,
      exOne: exOne ?? this.exOne,
      exTwo: exTwo ?? this.exTwo,
      exThree: exThree ?? this.exThree,
      exFour: exFour ?? this.exFour,
      exFive: exFive ?? this.exFive,
      exGif: exGif ?? this.exGif,
      reqReps: reqReps ?? this.reqReps,
    );
  }
}
