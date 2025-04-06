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
  final String dataCreatingPlan;
  TrainingPlanClass({
    required this.idUser,
    required this.dayOfWeek,
    this.mainMuscle,
    this.secondaryMuscle,
    required this.exerciseOne,
    this.exerciseTwo,
    this.exerciseThree,
    this.exerciseFour,
    this.exerciseFive,
    required this.reqReps,
    required this.dataCreatingPlan,
  });

  TrainingPlanClass copyWith({
    String? idUser,
    String? dayOfWeek,
    String? mainMuscle,
    String? secondaryMuscle,
    String? exerciseOne,
    String? exerciseTwo,
    String? exerciseThree,
    String? exerciseFour,
    String? exerciseFive,
    String? reqReps,
    String? dataCreatingPlan,
  }) {
    return TrainingPlanClass(
      idUser: idUser ?? this.idUser,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
      exerciseOne: exerciseOne ?? this.exerciseOne,
      exerciseTwo: exerciseTwo ?? this.exerciseTwo,
      exerciseThree: exerciseThree ?? this.exerciseThree,
      exerciseFour: exerciseFour ?? this.exerciseFour,
      exerciseFive: exerciseFive ?? this.exerciseFive,
      reqReps: reqReps ?? this.reqReps,
      dataCreatingPlan: dataCreatingPlan ?? this.dataCreatingPlan,
    );
  }

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
      'dataCreatingPlan': dataCreatingPlan,
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
      dataCreatingPlan: map['dataCreatingPlan'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingPlanClass.fromJson(String source) =>
      TrainingPlanClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrainingPlanClass(idUser: $idUser, dayOfWeek: $dayOfWeek, mainMuscle: $mainMuscle, secondaryMuscle: $secondaryMuscle, exerciseOne: $exerciseOne, exerciseTwo: $exerciseTwo, exerciseThree: $exerciseThree, exerciseFour: $exerciseFour, exerciseFive: $exerciseFive, reqReps: $reqReps, dataCreatingPlan: $dataCreatingPlan)';
  }

  @override
  bool operator ==(covariant TrainingPlanClass other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.dayOfWeek == dayOfWeek &&
        other.mainMuscle == mainMuscle &&
        other.secondaryMuscle == secondaryMuscle &&
        other.exerciseOne == exerciseOne &&
        other.exerciseTwo == exerciseTwo &&
        other.exerciseThree == exerciseThree &&
        other.exerciseFour == exerciseFour &&
        other.exerciseFive == exerciseFive &&
        other.reqReps == reqReps &&
        other.dataCreatingPlan == dataCreatingPlan;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
        dayOfWeek.hashCode ^
        mainMuscle.hashCode ^
        secondaryMuscle.hashCode ^
        exerciseOne.hashCode ^
        exerciseTwo.hashCode ^
        exerciseThree.hashCode ^
        exerciseFour.hashCode ^
        exerciseFive.hashCode ^
        reqReps.hashCode ^
        dataCreatingPlan.hashCode;
  }
}
