import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TempTrainModel {
  final String idUser;
  final DateTime dayOfTraining;
  final String? mainMuscle;
  final String? secondaryMuscle;
  final int tempExercise;

  final String exerciseOne;
  final int? countRepsExOne;
  final String? maxWeightExOne;
  final bool? exOneSkipped;

  final String? exerciseTwo;
  final int? countRepsExTwo;
  final String? maxWeightExTwo;
  final bool? exTwoSkipped;

  final String? exerciseThree;
  final int? countRepsExThree;
  final String? maxWeightExThree;
  final bool? exThreeSkipped;

  final String? exerciseFour;
  final int? countRepsExFour;
  final String? maxWeightExFour;
  final bool? exFourSkipped;

  final String? exerciseFive;
  final int? countRepsExFive;
  final String? maxWeightExFive;
  final bool? exFiveSkipped;

  TempTrainModel({
    required this.idUser,
    required this.dayOfTraining,
    this.mainMuscle,
    this.secondaryMuscle,
    required this.tempExercise,
    required this.exerciseOne,
    this.countRepsExOne,
    this.maxWeightExOne,
    this.exOneSkipped,
    this.exerciseTwo,
    this.countRepsExTwo,
    this.maxWeightExTwo,
    this.exTwoSkipped,
    this.exerciseThree,
    this.countRepsExThree,
    this.maxWeightExThree,
    this.exThreeSkipped,
    this.exerciseFour,
    this.countRepsExFour,
    this.maxWeightExFour,
    this.exFourSkipped,
    this.exerciseFive,
    this.countRepsExFive,
    this.maxWeightExFive,
    this.exFiveSkipped,
  });

  TempTrainModel copyWith({
    String? idUser,
    DateTime? dayOfTraining,
    String? mainMuscle,
    String? secondaryMuscle,
    int? tempExercise,
    String? exerciseOne,
    int? countRepsExOne,
    String? maxWeightExOne,
    bool? exOneSkipped,
    String? exerciseTwo,
    int? countRepsExTwo,
    String? maxWeightExTwo,
    bool? exTwoSkipped,
    String? exerciseThree,
    int? countRepsExThree,
    String? maxWeightExThree,
    bool? exThreeSkipped,
    String? exerciseFour,
    int? countRepsExFour,
    String? maxWeightExFour,
    bool? exFourSkipped,
    String? exerciseFive,
    int? countRepsExFive,
    String? maxWeightExFive,
    bool? exFiveSkipped,
  }) {
    return TempTrainModel(
      idUser: idUser ?? this.idUser,
      dayOfTraining: dayOfTraining ?? this.dayOfTraining,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
      tempExercise: tempExercise ?? this.tempExercise,
      exerciseOne: exerciseOne ?? this.exerciseOne,
      countRepsExOne: countRepsExOne ?? this.countRepsExOne,
      maxWeightExOne: maxWeightExOne ?? this.maxWeightExOne,
      exOneSkipped: exOneSkipped ?? this.exOneSkipped,
      exerciseTwo: exerciseTwo ?? this.exerciseTwo,
      countRepsExTwo: countRepsExTwo ?? this.countRepsExTwo,
      maxWeightExTwo: maxWeightExTwo ?? this.maxWeightExTwo,
      exTwoSkipped: exTwoSkipped ?? this.exTwoSkipped,
      exerciseThree: exerciseThree ?? this.exerciseThree,
      countRepsExThree: countRepsExThree ?? this.countRepsExThree,
      maxWeightExThree: maxWeightExThree ?? this.maxWeightExThree,
      exThreeSkipped: exThreeSkipped ?? this.exThreeSkipped,
      exerciseFour: exerciseFour ?? this.exerciseFour,
      countRepsExFour: countRepsExFour ?? this.countRepsExFour,
      maxWeightExFour: maxWeightExFour ?? this.maxWeightExFour,
      exFourSkipped: exFourSkipped ?? this.exFourSkipped,
      exerciseFive: exerciseFive ?? this.exerciseFive,
      countRepsExFive: countRepsExFive ?? this.countRepsExFive,
      maxWeightExFive: maxWeightExFive ?? this.maxWeightExFive,
      exFiveSkipped: exFiveSkipped ?? this.exFiveSkipped,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'dayOfTraining': dayOfTraining.millisecondsSinceEpoch,
      'mainMuscle': mainMuscle,
      'secondaryMuscle': secondaryMuscle,
      'tempExercise': tempExercise,
      'exerciseOne': exerciseOne,
      'countRepsExOne': countRepsExOne,
      'maxWeightExOne': maxWeightExOne,
      'exOneSkipped': exOneSkipped,
      'exerciseTwo': exerciseTwo,
      'countRepsExTwo': countRepsExTwo,
      'maxWeightExTwo': maxWeightExTwo,
      'exTwoSkipped': exTwoSkipped,
      'exerciseThree': exerciseThree,
      'countRepsExThree': countRepsExThree,
      'maxWeightExThree': maxWeightExThree,
      'exThreeSkipped': exThreeSkipped,
      'exerciseFour': exerciseFour,
      'countRepsExFour': countRepsExFour,
      'maxWeightExFour': maxWeightExFour,
      'exFourSkipped': exFourSkipped,
      'exerciseFive': exerciseFive,
      'countRepsExFive': countRepsExFive,
      'maxWeightExFive': maxWeightExFive,
      'exFiveSkipped': exFiveSkipped,
    };
  }

  factory TempTrainModel.fromMap(Map<String, dynamic> map) {
    return TempTrainModel(
      idUser: map['idUser'] as String,
      dayOfTraining:
          DateTime.fromMillisecondsSinceEpoch(map['dayOfTraining'] as int),
      mainMuscle:
          map['mainMuscle'] != null ? map['mainMuscle'] as String : null,
      secondaryMuscle: map['secondaryMuscle'] != null
          ? map['secondaryMuscle'] as String
          : null,
      tempExercise: map['tempExercise'] as int,
      exerciseOne: map['exerciseOne'] as String,
      countRepsExOne:
          map['countRepsExOne'] != null ? map['countRepsExOne'] as int : null,
      maxWeightExOne: map['maxWeightExOne'] != null
          ? map['maxWeightExOne'] as String
          : null,
      exOneSkipped:
          map['exOneSkipped'] != null ? map['exOneSkipped'] as bool : null,
      exerciseTwo:
          map['exerciseTwo'] != null ? map['exerciseTwo'] as String : null,
      countRepsExTwo:
          map['countRepsExTwo'] != null ? map['countRepsExTwo'] as int : null,
      maxWeightExTwo: map['maxWeightExTwo'] != null
          ? map['maxWeightExTwo'] as String
          : null,
      exTwoSkipped:
          map['exTwoSkipped'] != null ? map['exTwoSkipped'] as bool : null,
      exerciseThree:
          map['exerciseThree'] != null ? map['exerciseThree'] as String : null,
      countRepsExThree: map['countRepsExThree'] != null
          ? map['countRepsExThree'] as int
          : null,
      maxWeightExThree: map['maxWeightExThree'] != null
          ? map['maxWeightExThree'] as String
          : null,
      exThreeSkipped:
          map['exThreeSkipped'] != null ? map['exThreeSkipped'] as bool : null,
      exerciseFour:
          map['exerciseFour'] != null ? map['exerciseFour'] as String : null,
      countRepsExFour:
          map['countRepsExFour'] != null ? map['countRepsExFour'] as int : null,
      maxWeightExFour: map['maxWeightExFour'] != null
          ? map['maxWeightExFour'] as String
          : null,
      exFourSkipped:
          map['exFourSkipped'] != null ? map['exFourSkipped'] as bool : null,
      exerciseFive:
          map['exerciseFive'] != null ? map['exerciseFive'] as String : null,
      countRepsExFive:
          map['countRepsExFive'] != null ? map['countRepsExFive'] as int : null,
      maxWeightExFive: map['maxWeightExFive'] != null
          ? map['maxWeightExFive'] as String
          : null,
      exFiveSkipped:
          map['exFiveSkipped'] != null ? map['exFiveSkipped'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TempTrainModel.fromJson(String source) =>
      TempTrainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TempTrainModel(idUser: $idUser, dayOfTraining: $dayOfTraining, mainMuscle: $mainMuscle, secondaryMuscle: $secondaryMuscle, tempExercise: $tempExercise, exerciseOne: $exerciseOne, countRepsExOne: $countRepsExOne, maxWeightExOne: $maxWeightExOne, exOneSkipped: $exOneSkipped, exerciseTwo: $exerciseTwo, countRepsExTwo: $countRepsExTwo, maxWeightExTwo: $maxWeightExTwo, exTwoSkipped: $exTwoSkipped, exerciseThree: $exerciseThree, countRepsExThree: $countRepsExThree, maxWeightExThree: $maxWeightExThree, exThreeSkipped: $exThreeSkipped, exerciseFour: $exerciseFour, countRepsExFour: $countRepsExFour, maxWeightExFour: $maxWeightExFour, exFourSkipped: $exFourSkipped, exerciseFive: $exerciseFive, countRepsExFive: $countRepsExFive, maxWeightExFive: $maxWeightExFive, exFiveSkipped: $exFiveSkipped)';
  }

  @override
  bool operator ==(covariant TempTrainModel other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.dayOfTraining == dayOfTraining &&
        other.mainMuscle == mainMuscle &&
        other.secondaryMuscle == secondaryMuscle &&
        other.tempExercise == tempExercise &&
        other.exerciseOne == exerciseOne &&
        other.countRepsExOne == countRepsExOne &&
        other.maxWeightExOne == maxWeightExOne &&
        other.exOneSkipped == exOneSkipped &&
        other.exerciseTwo == exerciseTwo &&
        other.countRepsExTwo == countRepsExTwo &&
        other.maxWeightExTwo == maxWeightExTwo &&
        other.exTwoSkipped == exTwoSkipped &&
        other.exerciseThree == exerciseThree &&
        other.countRepsExThree == countRepsExThree &&
        other.maxWeightExThree == maxWeightExThree &&
        other.exThreeSkipped == exThreeSkipped &&
        other.exerciseFour == exerciseFour &&
        other.countRepsExFour == countRepsExFour &&
        other.maxWeightExFour == maxWeightExFour &&
        other.exFourSkipped == exFourSkipped &&
        other.exerciseFive == exerciseFive &&
        other.countRepsExFive == countRepsExFive &&
        other.maxWeightExFive == maxWeightExFive &&
        other.exFiveSkipped == exFiveSkipped;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
        dayOfTraining.hashCode ^
        mainMuscle.hashCode ^
        secondaryMuscle.hashCode ^
        tempExercise.hashCode ^
        exerciseOne.hashCode ^
        countRepsExOne.hashCode ^
        maxWeightExOne.hashCode ^
        exOneSkipped.hashCode ^
        exerciseTwo.hashCode ^
        countRepsExTwo.hashCode ^
        maxWeightExTwo.hashCode ^
        exTwoSkipped.hashCode ^
        exerciseThree.hashCode ^
        countRepsExThree.hashCode ^
        maxWeightExThree.hashCode ^
        exThreeSkipped.hashCode ^
        exerciseFour.hashCode ^
        countRepsExFour.hashCode ^
        maxWeightExFour.hashCode ^
        exFourSkipped.hashCode ^
        exerciseFive.hashCode ^
        countRepsExFive.hashCode ^
        maxWeightExFive.hashCode ^
        exFiveSkipped.hashCode;
  }
}
