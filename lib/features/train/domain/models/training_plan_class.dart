// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrainingPlanClass {
  final String idUser;
  final String dayOfWeek;
  final String? mainMuscle;
  final String? secondaryMuscle;
  final String exerciseOne;
  final String? exerciseTwo;
  final String? exerciseThree;
  final String? exerciseFour;
  final String? exerciseFive;
  final String reqReps;
  TrainingPlanClass({
    required this.idUser,
    required this.dayOfWeek,
    required this.mainMuscle,
    required this.secondaryMuscle,
    required this.exerciseOne,
    required this.exerciseTwo,
    required this.exerciseThree,
    required this.exerciseFour,
    required this.exerciseFive,
    required this.reqReps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'dayOfWeek': dayOfWeek,
      'mainMuscle': mainMuscle,
      'secondaryMuscle': secondaryMuscle,
      'exerciseOne': exerciseOne,
      'exerciseTwo': exerciseTwo,
      'exerciseThree': exerciseThree,
      'exerciseFour': exerciseFour,
      'exerciseFive': exerciseFive,
      'reqReps': reqReps,
    };
  }

  factory TrainingPlanClass.fromMap(Map<String, dynamic> map) {
    return TrainingPlanClass(
      idUser: map['idUser'] as String,
      dayOfWeek: map['dayOfWeek'] as String,
      mainMuscle:
          map['mainMuscle'] != null ? map['mainMuscle'] as String : null,
      secondaryMuscle: map['secondaryMuscle'] != null
          ? map['secondaryMuscle'] as String
          : null,
      exerciseOne: map['exerciseOne'] as String,
      exerciseTwo:
          map['exerciseTwo'] != null ? map['exerciseTwo'] as String : null,
      exerciseThree:
          map['exerciseThree'] != null ? map['exerciseThree'] as String : null,
      exerciseFour:
          map['exerciseFour'] != null ? map['exerciseFour'] as String : null,
      exerciseFive:
          map['exerciseFive'] != null ? map['exerciseFive'] as String : null,
      reqReps: map['reqReps'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingPlanClass.fromJson(String source) =>
      TrainingPlanClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrainingPlanClass(idUser: $idUser, dayOfWeek: $dayOfWeek, mainMuscle: $mainMuscle, secondaryMuscle: $secondaryMuscle, exerciseOne: $exerciseOne, exerciseTwo: $exerciseTwo, exerciseThree: $exerciseThree, exerciseFour: $exerciseFour, exerciseFive: $exerciseFive, reqReps: $reqReps)';
  }
}
