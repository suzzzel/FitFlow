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
    required this.reqReps,
  });
  @override
  String toString() {
    return 'ReadyTrainingPlanModel(idTrain:$idTrain, name: $name, level: $level, goal: $goal, weekday: $weekday, exOne: $exOne, exTwo: $exTwo, exThree: $exThree, exFour: $exFour, exFive: $exFive, reqReps: $reqReps)';
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
      reqReps: map['reqReps'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadyTrainingPlanModel.fromJson(String source) =>
      ReadyTrainingPlanModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
