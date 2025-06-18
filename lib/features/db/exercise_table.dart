import 'package:drift/drift.dart';

class ExerciseTable extends Table {
  IntColumn get id => integer()();
  TextColumn get bodyPart => text()();
  TextColumn get equipment => text()();
  TextColumn get name => text()();
  TextColumn get target => text()();
  TextColumn get secondaryMuscleZero => text().nullable()();
  TextColumn get secondaryMuscleOne => text().nullable()();
  TextColumn get secondaryMuscleTwo => text().nullable()();
  TextColumn get secondaryMuscleThree => text().nullable()();
  TextColumn get secondaryMuscleFour => text().nullable()();
  TextColumn get secondaryMuscleFive => text().nullable()();
  TextColumn get instructionsZero => text().nullable()();
  TextColumn get instructionsOne => text().nullable()();
  TextColumn get instructionsTwo => text().nullable()();
  TextColumn get instructionsThree => text().nullable()();
  TextColumn get instructionsFour => text().nullable()();
  TextColumn get instructionsFive => text().nullable()();
  TextColumn get instructionsSix => text().nullable()();
  TextColumn get instructionsSeven => text().nullable()();
  TextColumn get instructionsEight => text().nullable()();
  TextColumn get instructionsNine => text().nullable()();
  TextColumn get instructionsTen => text().nullable()();
}
