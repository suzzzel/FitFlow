import 'package:drift/drift.dart';

class UserInfoTable extends Table {
  IntColumn get id => integer()();
  TextColumn get createdAt => text()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
  TextColumn get email => text()();
  TextColumn get goal => text()();
  BoolColumn get sex => boolean()();
  IntColumn get height => integer()();
  IntColumn get weight => integer()();
  TextColumn get level => text()();
}
