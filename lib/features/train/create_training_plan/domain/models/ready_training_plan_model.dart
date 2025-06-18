import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String mainMuscle;
  final String? secondaryMuscle;
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
    required this.mainMuscle,
    this.secondaryMuscle,
    required this.reqReps,
  });

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
    String? mainMuscle,
    String? secondaryMuscle,
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
      mainMuscle: mainMuscle ?? this.mainMuscle,
      secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
      reqReps: reqReps ?? this.reqReps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTrain': idTrain,
      'name': name,
      'level': level,
      'goal': goal,
      'weekday': weekday,
      'exOne': exOne,
      'exTwo': exTwo,
      'exThree': exThree,
      'exFour': exFour,
      'exFive': exFive,
      'mainMuscle': mainMuscle,
      'secondaryMuscle': secondaryMuscle,
      'reqReps': reqReps,
    };
  }

  factory ReadyTrainingPlanModel.fromMap(Map<String, dynamic> map) {
    return ReadyTrainingPlanModel(
      idTrain: map['idTrain'] as int,
      name: map['name'] as String,
      level: map['level'] as String,
      goal: map['goal'] as String,
      weekday: map['weekday'] as String,
      exOne: map['exOne'] as String,
      exTwo: map['exTwo'] != null ? map['exTwo'] as String : null,
      exThree: map['exThree'] != null ? map['exThree'] as String : null,
      exFour: map['exFour'] != null ? map['exFour'] as String : null,
      exFive: map['exFive'] != null ? map['exFive'] as String : null,
      mainMuscle: map['mainMuscle'] as String,
      secondaryMuscle: map['secondaryMuscle'] != null
          ? map['secondaryMuscle'] as String
          : null,
      reqReps: map['reqReps'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadyTrainingPlanModel.fromJson(String source) =>
      ReadyTrainingPlanModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReadyTrainingPlanModel(idTrain: $idTrain, name: $name, level: $level, goal: $goal, weekday: $weekday, exOne: $exOne, exTwo: $exTwo, exThree: $exThree, exFour: $exFour, exFive: $exFive, mainMuscle: $mainMuscle, secondaryMuscle: $secondaryMuscle, reqReps: $reqReps)';
  }

  @override
  bool operator ==(covariant ReadyTrainingPlanModel other) {
    if (identical(this, other)) return true;

    return other.idTrain == idTrain &&
        other.name == name &&
        other.level == level &&
        other.goal == goal &&
        other.weekday == weekday &&
        other.exOne == exOne &&
        other.exTwo == exTwo &&
        other.exThree == exThree &&
        other.exFour == exFour &&
        other.exFive == exFive &&
        other.mainMuscle == mainMuscle &&
        other.secondaryMuscle == secondaryMuscle &&
        other.reqReps == reqReps;
  }

  @override
  int get hashCode {
    return idTrain.hashCode ^
        name.hashCode ^
        level.hashCode ^
        goal.hashCode ^
        weekday.hashCode ^
        exOne.hashCode ^
        exTwo.hashCode ^
        exThree.hashCode ^
        exFour.hashCode ^
        exFive.hashCode ^
        mainMuscle.hashCode ^
        secondaryMuscle.hashCode ^
        reqReps.hashCode;
  }
}
