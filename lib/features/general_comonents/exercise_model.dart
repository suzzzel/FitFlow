import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final int id;
  final String bodyPart;
  final String equipment;
  final String name;
  final String target;

  @JsonKey(name: 'secondaryMuscles/0')
  final String? secondaryMuscleZero;

  @JsonKey(name: 'secondaryMuscles/1')
  final String? secondaryMuscleOne;

  @JsonKey(name: 'secondaryMuscles/2')
  final String? secondaryMuscleTwo;

  @JsonKey(name: 'secondaryMuscles/3')
  final String? secondaryMuscleThree;

  @JsonKey(name: 'secondaryMuscles/4')
  final String? secondaryMuscleFour;

  @JsonKey(name: 'secondaryMuscles/5')
  final String? secondaryMuscleFive;

  @JsonKey(name: 'instructions/0')
  final String? instructionsZero;

  @JsonKey(name: 'instructions/1')
  final String? instructionsOne;

  @JsonKey(name: 'instructions/2')
  final String? instructionsTwo;

  @JsonKey(name: 'instructions/3')
  final String? instructionsThree;

  @JsonKey(name: 'instructions/4')
  final String? instructionsFour;

  @JsonKey(name: 'instructions/5')
  final String? instructionsFive;

  @JsonKey(name: 'instructions/6')
  final String? instructionsSix;

  @JsonKey(name: 'instructions/7')
  final String? instructionsSeven;

  @JsonKey(name: 'instructions/8')
  final String? instructionsEight;

  @JsonKey(name: 'instructions/9')
  final String? instructionsNine;

  @JsonKey(name: 'instructions/10')
  final String? instructionsTen;

  ExerciseModel({
    required this.id,
    required this.bodyPart,
    required this.equipment,
    required this.name,
    required this.target,
    this.secondaryMuscleZero,
    this.secondaryMuscleOne,
    this.secondaryMuscleTwo,
    this.secondaryMuscleThree,
    this.secondaryMuscleFour,
    this.secondaryMuscleFive,
    this.instructionsZero,
    this.instructionsOne,
    this.instructionsTwo,
    this.instructionsThree,
    this.instructionsFour,
    this.instructionsFive,
    this.instructionsSix,
    this.instructionsSeven,
    this.instructionsEight,
    this.instructionsNine,
    this.instructionsTen,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}
