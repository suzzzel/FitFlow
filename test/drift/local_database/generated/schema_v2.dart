// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class UserInfoTable extends Table
    with TableInfo<UserInfoTable, UserInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserInfoTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
      'goal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> sex = GeneratedColumn<bool>(
      'sex', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("sex" IN (0, 1))'));
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, name, age, email, goal, sex, height, weight, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_info_table';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserInfoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      goal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sex'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
    );
  }

  @override
  UserInfoTable createAlias(String alias) {
    return UserInfoTable(attachedDatabase, alias);
  }
}

class UserInfoTableData extends DataClass
    implements Insertable<UserInfoTableData> {
  final int id;
  final String createdAt;
  final String name;
  final int age;
  final String email;
  final String goal;
  final bool sex;
  final int height;
  final int weight;
  final String level;
  const UserInfoTableData(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.age,
      required this.email,
      required this.goal,
      required this.sex,
      required this.height,
      required this.weight,
      required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<String>(createdAt);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['email'] = Variable<String>(email);
    map['goal'] = Variable<String>(goal);
    map['sex'] = Variable<bool>(sex);
    map['height'] = Variable<int>(height);
    map['weight'] = Variable<int>(weight);
    map['level'] = Variable<String>(level);
    return map;
  }

  UserInfoTableCompanion toCompanion(bool nullToAbsent) {
    return UserInfoTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      age: Value(age),
      email: Value(email),
      goal: Value(goal),
      sex: Value(sex),
      height: Value(height),
      weight: Value(weight),
      level: Value(level),
    );
  }

  factory UserInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserInfoTableData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      email: serializer.fromJson<String>(json['email']),
      goal: serializer.fromJson<String>(json['goal']),
      sex: serializer.fromJson<bool>(json['sex']),
      height: serializer.fromJson<int>(json['height']),
      weight: serializer.fromJson<int>(json['weight']),
      level: serializer.fromJson<String>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<String>(createdAt),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'email': serializer.toJson<String>(email),
      'goal': serializer.toJson<String>(goal),
      'sex': serializer.toJson<bool>(sex),
      'height': serializer.toJson<int>(height),
      'weight': serializer.toJson<int>(weight),
      'level': serializer.toJson<String>(level),
    };
  }

  UserInfoTableData copyWith(
          {int? id,
          String? createdAt,
          String? name,
          int? age,
          String? email,
          String? goal,
          bool? sex,
          int? height,
          int? weight,
          String? level}) =>
      UserInfoTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        age: age ?? this.age,
        email: email ?? this.email,
        goal: goal ?? this.goal,
        sex: sex ?? this.sex,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        level: level ?? this.level,
      );
  UserInfoTableData copyWithCompanion(UserInfoTableCompanion data) {
    return UserInfoTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      email: data.email.present ? data.email.value : this.email,
      goal: data.goal.present ? data.goal.value : this.goal,
      sex: data.sex.present ? data.sex.value : this.sex,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('email: $email, ')
          ..write('goal: $goal, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, name, age, email, goal, sex, height, weight, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.age == this.age &&
          other.email == this.email &&
          other.goal == this.goal &&
          other.sex == this.sex &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.level == this.level);
}

class UserInfoTableCompanion extends UpdateCompanion<UserInfoTableData> {
  final Value<int> id;
  final Value<String> createdAt;
  final Value<String> name;
  final Value<int> age;
  final Value<String> email;
  final Value<String> goal;
  final Value<bool> sex;
  final Value<int> height;
  final Value<int> weight;
  final Value<String> level;
  final Value<int> rowid;
  const UserInfoTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.email = const Value.absent(),
    this.goal = const Value.absent(),
    this.sex = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserInfoTableCompanion.insert({
    required int id,
    required String createdAt,
    required String name,
    required int age,
    required String email,
    required String goal,
    required bool sex,
    required int height,
    required int weight,
    required String level,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        name = Value(name),
        age = Value(age),
        email = Value(email),
        goal = Value(goal),
        sex = Value(sex),
        height = Value(height),
        weight = Value(weight),
        level = Value(level);
  static Insertable<UserInfoTableData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? email,
    Expression<String>? goal,
    Expression<bool>? sex,
    Expression<int>? height,
    Expression<int>? weight,
    Expression<String>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (email != null) 'email': email,
      if (goal != null) 'goal': goal,
      if (sex != null) 'sex': sex,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserInfoTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? createdAt,
      Value<String>? name,
      Value<int>? age,
      Value<String>? email,
      Value<String>? goal,
      Value<bool>? sex,
      Value<int>? height,
      Value<int>? weight,
      Value<String>? level,
      Value<int>? rowid}) {
    return UserInfoTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      goal: goal ?? this.goal,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (sex.present) {
      map['sex'] = Variable<bool>(sex.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('email: $email, ')
          ..write('goal: $goal, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class QuotesTable extends Table with TableInfo<QuotesTable, QuotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  QuotesTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> firstPart = GeneratedColumn<String>(
      'first_part', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> secondPart = GeneratedColumn<String>(
      'second_part', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, firstPart, secondPart];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotes_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuotesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuotesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstPart: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_part'])!,
      secondPart: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}second_part'])!,
    );
  }

  @override
  QuotesTable createAlias(String alias) {
    return QuotesTable(attachedDatabase, alias);
  }
}

class QuotesTableData extends DataClass implements Insertable<QuotesTableData> {
  final int id;
  final String firstPart;
  final String secondPart;
  const QuotesTableData(
      {required this.id, required this.firstPart, required this.secondPart});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_part'] = Variable<String>(firstPart);
    map['second_part'] = Variable<String>(secondPart);
    return map;
  }

  QuotesTableCompanion toCompanion(bool nullToAbsent) {
    return QuotesTableCompanion(
      id: Value(id),
      firstPart: Value(firstPart),
      secondPart: Value(secondPart),
    );
  }

  factory QuotesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuotesTableData(
      id: serializer.fromJson<int>(json['id']),
      firstPart: serializer.fromJson<String>(json['firstPart']),
      secondPart: serializer.fromJson<String>(json['secondPart']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstPart': serializer.toJson<String>(firstPart),
      'secondPart': serializer.toJson<String>(secondPart),
    };
  }

  QuotesTableData copyWith({int? id, String? firstPart, String? secondPart}) =>
      QuotesTableData(
        id: id ?? this.id,
        firstPart: firstPart ?? this.firstPart,
        secondPart: secondPart ?? this.secondPart,
      );
  QuotesTableData copyWithCompanion(QuotesTableCompanion data) {
    return QuotesTableData(
      id: data.id.present ? data.id.value : this.id,
      firstPart: data.firstPart.present ? data.firstPart.value : this.firstPart,
      secondPart:
          data.secondPart.present ? data.secondPart.value : this.secondPart,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuotesTableData(')
          ..write('id: $id, ')
          ..write('firstPart: $firstPart, ')
          ..write('secondPart: $secondPart')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstPart, secondPart);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuotesTableData &&
          other.id == this.id &&
          other.firstPart == this.firstPart &&
          other.secondPart == this.secondPart);
}

class QuotesTableCompanion extends UpdateCompanion<QuotesTableData> {
  final Value<int> id;
  final Value<String> firstPart;
  final Value<String> secondPart;
  const QuotesTableCompanion({
    this.id = const Value.absent(),
    this.firstPart = const Value.absent(),
    this.secondPart = const Value.absent(),
  });
  QuotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String firstPart,
    required String secondPart,
  })  : firstPart = Value(firstPart),
        secondPart = Value(secondPart);
  static Insertable<QuotesTableData> custom({
    Expression<int>? id,
    Expression<String>? firstPart,
    Expression<String>? secondPart,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstPart != null) 'first_part': firstPart,
      if (secondPart != null) 'second_part': secondPart,
    });
  }

  QuotesTableCompanion copyWith(
      {Value<int>? id, Value<String>? firstPart, Value<String>? secondPart}) {
    return QuotesTableCompanion(
      id: id ?? this.id,
      firstPart: firstPart ?? this.firstPart,
      secondPart: secondPart ?? this.secondPart,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstPart.present) {
      map['first_part'] = Variable<String>(firstPart.value);
    }
    if (secondPart.present) {
      map['second_part'] = Variable<String>(secondPart.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotesTableCompanion(')
          ..write('id: $id, ')
          ..write('firstPart: $firstPart, ')
          ..write('secondPart: $secondPart')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final UserInfoTable userInfoTable = UserInfoTable(this);
  late final QuotesTable quotesTable = QuotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userInfoTable, quotesTable];
  @override
  int get schemaVersion => 2;
}
