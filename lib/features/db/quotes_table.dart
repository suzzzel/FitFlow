import 'package:drift/drift.dart';

class QuotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstPart => text()();
  TextColumn get secondPart => text()();
}
