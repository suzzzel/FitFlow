// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: (json['id'] as num).toInt(),
      bodyPart: json['bodyPart'] as String,
      equipment: json['equipment'] as String,
      name: json['name'] as String,
      target: json['target'] as String,
      secondaryMuscleZero: json['secondaryMuscles/0'] as String?,
      secondaryMuscleOne: json['secondaryMuscles/1'] as String?,
      secondaryMuscleTwo: json['secondaryMuscles/2'] as String?,
      secondaryMuscleThree: json['secondaryMuscles/3'] as String?,
      secondaryMuscleFour: json['secondaryMuscles/4'] as String?,
      secondaryMuscleFive: json['secondaryMuscles/5'] as String?,
      instructionsZero: json['instructions/0'] as String?,
      instructionsOne: json['instructions/1'] as String?,
      instructionsTwo: json['instructions/2'] as String?,
      instructionsThree: json['instructions/3'] as String?,
      instructionsFour: json['instructions/4'] as String?,
      instructionsFive: json['instructions/5'] as String?,
      instructionsSix: json['instructions/6'] as String?,
      instructionsSeven: json['instructions/7'] as String?,
      instructionsEight: json['instructions/8'] as String?,
      instructionsNine: json['instructions/9'] as String?,
      instructionsTen: json['instructions/10'] as String?,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodyPart': instance.bodyPart,
      'equipment': instance.equipment,
      'name': instance.name,
      'target': instance.target,
      'secondaryMuscles/0': instance.secondaryMuscleZero,
      'secondaryMuscles/1': instance.secondaryMuscleOne,
      'secondaryMuscles/2': instance.secondaryMuscleTwo,
      'secondaryMuscles/3': instance.secondaryMuscleThree,
      'secondaryMuscles/4': instance.secondaryMuscleFour,
      'secondaryMuscles/5': instance.secondaryMuscleFive,
      'instructions/0': instance.instructionsZero,
      'instructions/1': instance.instructionsOne,
      'instructions/2': instance.instructionsTwo,
      'instructions/3': instance.instructionsThree,
      'instructions/4': instance.instructionsFour,
      'instructions/5': instance.instructionsFive,
      'instructions/6': instance.instructionsSix,
      'instructions/7': instance.instructionsSeven,
      'instructions/8': instance.instructionsEight,
      'instructions/9': instance.instructionsNine,
      'instructions/10': instance.instructionsTen,
    };
