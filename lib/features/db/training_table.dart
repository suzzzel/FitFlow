import 'package:drift/drift.dart';

class TrainingTable extends Table {
  DateTimeColumn get dayOfTraining => dateTime()();
  TextColumn get mainMuscle => text().nullable()();
  TextColumn get exerciseOne => text()();
  IntColumn get countRepsExOne => integer()();
  TextColumn get maxWeightExOne => text()();
  TextColumn get exerciseTwo => text().nullable()();
  IntColumn get countRepsExTwo => integer()();
  TextColumn get maxWeightExTwo => text()();
  TextColumn get exerciseThree => text().nullable()();
  IntColumn get countRepsExThree => integer()();
  TextColumn get maxWeightExThree => text()();
  TextColumn get exerciseFour => text().nullable()();
  IntColumn get countRepsExFour => integer()();
  TextColumn get maxWeightExFour => text()();
  TextColumn get exerciseFive => text().nullable()();
  IntColumn get countRepsExFive => integer()();
  TextColumn get maxWeightExFive => text()();
}
