import 'package:drift/drift.dart';

class TrainingPlanTable extends Table {
  TextColumn get idUser => text()();
  TextColumn get dayOfWeek => text()();
  TextColumn get mainMuscle => text().nullable()();
  TextColumn get secondaryMuscle => text().nullable()();
  TextColumn get exerciseOne => text()();
  TextColumn get exerciseTwo => text().nullable()();
  TextColumn get exerciseThree => text().nullable()();
  TextColumn get exerciseFour => text().nullable()();
  TextColumn get exerciseFive => text().nullable()();
  TextColumn get reqReps => text()();
  TextColumn get dataCreatingPlan => text()();
}
