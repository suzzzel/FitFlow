import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';

class MainProgressModel {
  int countOfTrainings;
  int middlePercentOfTrainings;
  int countOfRepsAllTime;
  List<TrainingDayClass> listOfTrainings;
  MainProgressModel({
    required this.countOfTrainings,
    required this.middlePercentOfTrainings,
    required this.countOfRepsAllTime,
    required this.listOfTrainings,
  });

  MainProgressModel copyWith({
    int? countOfTrainings,
    int? middlePercentOfTrainings,
    int? countOfRepsAllTime,
    List<TrainingDayClass>? listOfTrainings,
  }) {
    return MainProgressModel(
      countOfTrainings: countOfTrainings ?? this.countOfTrainings,
      middlePercentOfTrainings:
          middlePercentOfTrainings ?? this.middlePercentOfTrainings,
      countOfRepsAllTime: countOfRepsAllTime ?? this.countOfRepsAllTime,
      listOfTrainings: listOfTrainings ?? this.listOfTrainings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countOfTrainings': countOfTrainings,
      'middlePercentOfTrainings': middlePercentOfTrainings,
      'countOfRepsAllTime': countOfRepsAllTime,
      'listOfTrainings': listOfTrainings.map((x) => x.toMap()).toList(),
    };
  }

  factory MainProgressModel.fromMap(Map<String, dynamic> map) {
    return MainProgressModel(
      countOfTrainings: map['countOfTrainings'] as int,
      middlePercentOfTrainings: map['middlePercentOfTrainings'] as int,
      countOfRepsAllTime: map['countOfRepsAllTime'] as int,
      listOfTrainings: List<TrainingDayClass>.from(
        (map['listOfTrainings'] as List<int>).map<TrainingDayClass>(
          (x) => TrainingDayClass.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MainProgressModel.fromJson(String source) =>
      MainProgressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainProgressModel(countOfTrainings: $countOfTrainings, middlePercentOfTrainings: $middlePercentOfTrainings, countOfRepsAllTime: $countOfRepsAllTime, listOfTrainings: $listOfTrainings)';
  }

  @override
  bool operator ==(covariant MainProgressModel other) {
    if (identical(this, other)) return true;

    return other.countOfTrainings == countOfTrainings &&
        other.middlePercentOfTrainings == middlePercentOfTrainings &&
        other.countOfRepsAllTime == countOfRepsAllTime &&
        listEquals(other.listOfTrainings, listOfTrainings);
  }

  @override
  int get hashCode {
    return countOfTrainings.hashCode ^
        middlePercentOfTrainings.hashCode ^
        countOfRepsAllTime.hashCode ^
        listOfTrainings.hashCode;
  }
}
