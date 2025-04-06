import 'package:drift/drift.dart';

class ExerciseTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get urlGif => text()();
  TextColumn get mainMuscle => text()();
  TextColumn get secondaryMuscle => text()();
  TextColumn get instructionsOne => text()();
  TextColumn get instructionsTwo => text()();
  TextColumn get instructionsThree => text()();
  TextColumn get instructionsFour => text()();
  TextColumn get equipment => text()();
}
