// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrainingDayClass {
  final bool isChillday;
  final bool? isTrainOver;
  final String? idUser;
  final String? dayOfTraining;
  final String? mainMuscle;
  final String? exerciseOne;
  final int? countRepsExOne;
  final String? maxWeightExOne;
  final String? exerciseTwo;
  final int? countRepsExTwo;
  final String? maxWeightExTwo;
  final String? exerciseThree;
  final int? countRepsExThree;
  final String? maxWeightExThree;
  final String? exerciseFour;
  final int? countRepsExFour;
  final String? maxWeightExFour;
  final String? exerciseFive;
  final int? countRepsExFive;
  final String? maxWeightExFive;
  final int? percentOfTrainDone;
  TrainingDayClass({
    required this.isChillday,
    this.isTrainOver,
    this.idUser,
    this.dayOfTraining,
    this.mainMuscle,
    this.exerciseOne,
    this.countRepsExOne,
    this.maxWeightExOne,
    this.exerciseTwo,
    this.countRepsExTwo,
    this.maxWeightExTwo,
    this.exerciseThree,
    this.countRepsExThree,
    this.maxWeightExThree,
    this.exerciseFour,
    this.countRepsExFour,
    this.maxWeightExFour,
    this.exerciseFive,
    this.countRepsExFive,
    this.maxWeightExFive,
    this.percentOfTrainDone,
  });

  TrainingDayClass copyWith({
    bool? isChillday,
    bool? isTrainOver,
    String? idUser,
    String? dayOfTraining,
    String? mainMuscle,
    String? exerciseOne,
    int? countRepsExOne,
    String? maxWeightExOne,
    String? exerciseTwo,
    int? countRepsExTwo,
    String? maxWeightExTwo,
    String? exerciseThree,
    int? countRepsExThree,
    String? maxWeightExThree,
    String? exerciseFour,
    int? countRepsExFour,
    String? maxWeightExFour,
    String? exerciseFive,
    int? countRepsExFive,
    String? maxWeightExFive,
    int? percentOfTrainDone,
  }) {
    return TrainingDayClass(
      isChillday: isChillday ?? this.isChillday,
      isTrainOver: isTrainOver ?? this.isTrainOver,
      idUser: idUser ?? this.idUser,
      dayOfTraining: dayOfTraining ?? this.dayOfTraining,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      exerciseOne: exerciseOne ?? this.exerciseOne,
      countRepsExOne: countRepsExOne ?? this.countRepsExOne,
      maxWeightExOne: maxWeightExOne ?? this.maxWeightExOne,
      exerciseTwo: exerciseTwo ?? this.exerciseTwo,
      countRepsExTwo: countRepsExTwo ?? this.countRepsExTwo,
      maxWeightExTwo: maxWeightExTwo ?? this.maxWeightExTwo,
      exerciseThree: exerciseThree ?? this.exerciseThree,
      countRepsExThree: countRepsExThree ?? this.countRepsExThree,
      maxWeightExThree: maxWeightExThree ?? this.maxWeightExThree,
      exerciseFour: exerciseFour ?? this.exerciseFour,
      countRepsExFour: countRepsExFour ?? this.countRepsExFour,
      maxWeightExFour: maxWeightExFour ?? this.maxWeightExFour,
      exerciseFive: exerciseFive ?? this.exerciseFive,
      countRepsExFive: countRepsExFive ?? this.countRepsExFive,
      maxWeightExFive: maxWeightExFive ?? this.maxWeightExFive,
      percentOfTrainDone: percentOfTrainDone ?? this.percentOfTrainDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isChillday': isChillday,
      'isTrainOver': isTrainOver,
      'idUser': idUser,
      'dayOfTraining': dayOfTraining,
      'mainMuscle': mainMuscle,
      'exerciseOne': exerciseOne,
      'countRepsExOne': countRepsExOne,
      'maxWeightExOne': maxWeightExOne,
      'exerciseTwo': exerciseTwo,
      'countRepsExTwo': countRepsExTwo,
      'maxWeightExTwo': maxWeightExTwo,
      'exerciseThree': exerciseThree,
      'countRepsExThree': countRepsExThree,
      'maxWeightExThree': maxWeightExThree,
      'exerciseFour': exerciseFour,
      'countRepsExFour': countRepsExFour,
      'maxWeightExFour': maxWeightExFour,
      'exerciseFive': exerciseFive,
      'countRepsExFive': countRepsExFive,
      'maxWeightExFive': maxWeightExFive,
      'percentOfTrainDone': percentOfTrainDone,
    };
  }

  List<String> getExercise() {
    final List<String> returnList = [];
    final listExercise = [
      exerciseOne,
      exerciseTwo,
      exerciseThree,
      exerciseFour,
      exerciseFive
    ];
    for (var x in listExercise) {
      if (x == null) {
        continue;
      } else {
        returnList.add(x);
      }
    }
    return returnList;
  }

  factory TrainingDayClass.fromMap(Map<String, dynamic> map) {
    return TrainingDayClass(
      isChillday: map['isChillday'] as bool,
      isTrainOver:
          map['isTrainOver'] != null ? map['isTrainOver'] as bool : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      dayOfTraining:
          map['dayOfTraining'] != null ? map['dayOfTraining'] as String : null,
      mainMuscle:
          map['mainMuscle'] != null ? map['mainMuscle'] as String : null,
      exerciseOne:
          map['exerciseOne'] != null ? map['exerciseOne'] as String : null,
      countRepsExOne:
          map['countRepsExOne'] != null ? map['countRepsExOne'] as int : null,
      maxWeightExOne: map['maxWeightExOne'] != null
          ? map['maxWeightExOne'] as String
          : null,
      exerciseTwo:
          map['exerciseTwo'] != null ? map['exerciseTwo'] as String : null,
      countRepsExTwo:
          map['countRepsExTwo'] != null ? map['countRepsExTwo'] as int : null,
      maxWeightExTwo: map['maxWeightExTwo'] != null
          ? map['maxWeightExTwo'] as String
          : null,
      exerciseThree:
          map['exerciseThree'] != null ? map['exerciseThree'] as String : null,
      countRepsExThree: map['countRepsExThree'] != null
          ? map['countRepsExThree'] as int
          : null,
      maxWeightExThree: map['maxWeightExThree'] != null
          ? map['maxWeightExThree'] as String
          : null,
      exerciseFour:
          map['exerciseFour'] != null ? map['exerciseFour'] as String : null,
      countRepsExFour:
          map['countRepsExFour'] != null ? map['countRepsExFour'] as int : null,
      maxWeightExFour: map['maxWeightExFour'] != null
          ? map['maxWeightExFour'] as String
          : null,
      exerciseFive:
          map['exerciseFive'] != null ? map['exerciseFive'] as String : null,
      countRepsExFive:
          map['countRepsExFive'] != null ? map['countRepsExFive'] as int : null,
      maxWeightExFive: map['maxWeightExFive'] != null
          ? map['maxWeightExFive'] as String
          : null,
      percentOfTrainDone: map['percentOfTrainDone'] != null
          ? map['percentOfTrainDone'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrainingDayClass.fromJson(String source) =>
      TrainingDayClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrainingDayClass(isChillday: $isChillday, isTrainOver: $isTrainOver, idUser: $idUser, dayOfTraining: $dayOfTraining, mainMuscle: $mainMuscle, exerciseOne: $exerciseOne, countRepsExOne: $countRepsExOne, maxWeightExOne: $maxWeightExOne, exerciseTwo: $exerciseTwo, countRepsExTwo: $countRepsExTwo, maxWeightExTwo: $maxWeightExTwo, exerciseThree: $exerciseThree, countRepsExThree: $countRepsExThree, maxWeightExThree: $maxWeightExThree, exerciseFour: $exerciseFour, countRepsExFour: $countRepsExFour, maxWeightExFour: $maxWeightExFour, exerciseFive: $exerciseFive, countRepsExFive: $countRepsExFive, maxWeightExFive: $maxWeightExFive, percentOfTrainDone: $percentOfTrainDone)';
  }

  @override
  bool operator ==(covariant TrainingDayClass other) {
    if (identical(this, other)) return true;

    return other.isChillday == isChillday &&
        other.isTrainOver == isTrainOver &&
        other.idUser == idUser &&
        other.dayOfTraining == dayOfTraining &&
        other.mainMuscle == mainMuscle &&
        other.exerciseOne == exerciseOne &&
        other.countRepsExOne == countRepsExOne &&
        other.maxWeightExOne == maxWeightExOne &&
        other.exerciseTwo == exerciseTwo &&
        other.countRepsExTwo == countRepsExTwo &&
        other.maxWeightExTwo == maxWeightExTwo &&
        other.exerciseThree == exerciseThree &&
        other.countRepsExThree == countRepsExThree &&
        other.maxWeightExThree == maxWeightExThree &&
        other.exerciseFour == exerciseFour &&
        other.countRepsExFour == countRepsExFour &&
        other.maxWeightExFour == maxWeightExFour &&
        other.exerciseFive == exerciseFive &&
        other.countRepsExFive == countRepsExFive &&
        other.maxWeightExFive == maxWeightExFive &&
        other.percentOfTrainDone == percentOfTrainDone;
  }

  @override
  int get hashCode {
    return isChillday.hashCode ^
        isTrainOver.hashCode ^
        idUser.hashCode ^
        dayOfTraining.hashCode ^
        mainMuscle.hashCode ^
        exerciseOne.hashCode ^
        countRepsExOne.hashCode ^
        maxWeightExOne.hashCode ^
        exerciseTwo.hashCode ^
        countRepsExTwo.hashCode ^
        maxWeightExTwo.hashCode ^
        exerciseThree.hashCode ^
        countRepsExThree.hashCode ^
        maxWeightExThree.hashCode ^
        exerciseFour.hashCode ^
        countRepsExFour.hashCode ^
        maxWeightExFour.hashCode ^
        exerciseFive.hashCode ^
        countRepsExFive.hashCode ^
        maxWeightExFive.hashCode ^
        percentOfTrainDone.hashCode;
  }
}
