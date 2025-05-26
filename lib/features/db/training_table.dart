import 'package:drift/drift.dart';

class TrainingTable extends Table {
  TextColumn get idUser => text()();
  TextColumn get dayOfTraining => text()();
  TextColumn get mainMuscle => text().nullable()();
  TextColumn get exerciseOne => text()();
  IntColumn get countRepsExOne => integer()();
  TextColumn get maxWeightExOne => text()();
  TextColumn get exerciseTwo => text().nullable()();
  IntColumn get countRepsExTwo => integer().nullable()();
  TextColumn get maxWeightExTwo => text().nullable()();
  TextColumn get exerciseThree => text().nullable()();
  IntColumn get countRepsExThree => integer().nullable()();
  TextColumn get maxWeightExThree => text().nullable()();
  TextColumn get exerciseFour => text().nullable()();
  IntColumn get countRepsExFour => integer().nullable()();
  TextColumn get maxWeightExFour => text().nullable()();
  TextColumn get exerciseFive => text().nullable()();
  IntColumn get countRepsExFive => integer().nullable()();
  TextColumn get maxWeightExFive => text().nullable()();
  IntColumn get percentOfTrainDone => integer()();
  BoolColumn get isTrainOver => boolean().nullable()();
}
