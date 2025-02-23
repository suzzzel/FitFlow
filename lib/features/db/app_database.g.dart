// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserInfoTableTable extends UserInfoTable
    with TableInfo<$UserInfoTableTable, UserInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
      'goal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<bool> sex = GeneratedColumn<bool>(
      'sex', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("sex" IN (0, 1))'));
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
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
  VerificationContext validateIntegrity(Insertable<UserInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal']!, _goalMeta));
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserInfoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  $UserInfoTableTable createAlias(String alias) {
    return $UserInfoTableTable(attachedDatabase, alias);
  }
}

class UserInfoTableData extends DataClass
    implements Insertable<UserInfoTableData> {
  final String id;
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
    map['id'] = Variable<String>(id);
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
      id: serializer.fromJson<String>(json['id']),
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
      'id': serializer.toJson<String>(id),
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
          {String? id,
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
  final Value<String> id;
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
    required String id,
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
    Expression<String>? id,
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
      {Value<String>? id,
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
      map['id'] = Variable<String>(id.value);
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

class $QuotesTableTable extends QuotesTable
    with TableInfo<$QuotesTableTable, QuotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstPartMeta =
      const VerificationMeta('firstPart');
  @override
  late final GeneratedColumn<String> firstPart = GeneratedColumn<String>(
      'first_part', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secondPartMeta =
      const VerificationMeta('secondPart');
  @override
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
  VerificationContext validateIntegrity(Insertable<QuotesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_part')) {
      context.handle(_firstPartMeta,
          firstPart.isAcceptableOrUnknown(data['first_part']!, _firstPartMeta));
    } else if (isInserting) {
      context.missing(_firstPartMeta);
    }
    if (data.containsKey('second_part')) {
      context.handle(
          _secondPartMeta,
          secondPart.isAcceptableOrUnknown(
              data['second_part']!, _secondPartMeta));
    } else if (isInserting) {
      context.missing(_secondPartMeta);
    }
    return context;
  }

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
  $QuotesTableTable createAlias(String alias) {
    return $QuotesTableTable(attachedDatabase, alias);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserInfoTableTable userInfoTable = $UserInfoTableTable(this);
  late final $QuotesTableTable quotesTable = $QuotesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userInfoTable, quotesTable];
}

typedef $$UserInfoTableTableCreateCompanionBuilder = UserInfoTableCompanion
    Function({
  required String id,
  required String createdAt,
  required String name,
  required int age,
  required String email,
  required String goal,
  required bool sex,
  required int height,
  required int weight,
  required String level,
  Value<int> rowid,
});
typedef $$UserInfoTableTableUpdateCompanionBuilder = UserInfoTableCompanion
    Function({
  Value<String> id,
  Value<String> createdAt,
  Value<String> name,
  Value<int> age,
  Value<String> email,
  Value<String> goal,
  Value<bool> sex,
  Value<int> height,
  Value<int> weight,
  Value<String> level,
  Value<int> rowid,
});

class $$UserInfoTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserInfoTableTable> {
  $$UserInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goal => $composableBuilder(
      column: $table.goal, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));
}

class $$UserInfoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserInfoTableTable> {
  $$UserInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goal => $composableBuilder(
      column: $table.goal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));
}

class $$UserInfoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserInfoTableTable> {
  $$UserInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<bool> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$UserInfoTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserInfoTableTable,
    UserInfoTableData,
    $$UserInfoTableTableFilterComposer,
    $$UserInfoTableTableOrderingComposer,
    $$UserInfoTableTableAnnotationComposer,
    $$UserInfoTableTableCreateCompanionBuilder,
    $$UserInfoTableTableUpdateCompanionBuilder,
    (
      UserInfoTableData,
      BaseReferences<_$AppDatabase, $UserInfoTableTable, UserInfoTableData>
    ),
    UserInfoTableData,
    PrefetchHooks Function()> {
  $$UserInfoTableTableTableManager(_$AppDatabase db, $UserInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserInfoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> goal = const Value.absent(),
            Value<bool> sex = const Value.absent(),
            Value<int> height = const Value.absent(),
            Value<int> weight = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserInfoTableCompanion(
            id: id,
            createdAt: createdAt,
            name: name,
            age: age,
            email: email,
            goal: goal,
            sex: sex,
            height: height,
            weight: weight,
            level: level,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String createdAt,
            required String name,
            required int age,
            required String email,
            required String goal,
            required bool sex,
            required int height,
            required int weight,
            required String level,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserInfoTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            name: name,
            age: age,
            email: email,
            goal: goal,
            sex: sex,
            height: height,
            weight: weight,
            level: level,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserInfoTableTable,
    UserInfoTableData,
    $$UserInfoTableTableFilterComposer,
    $$UserInfoTableTableOrderingComposer,
    $$UserInfoTableTableAnnotationComposer,
    $$UserInfoTableTableCreateCompanionBuilder,
    $$UserInfoTableTableUpdateCompanionBuilder,
    (
      UserInfoTableData,
      BaseReferences<_$AppDatabase, $UserInfoTableTable, UserInfoTableData>
    ),
    UserInfoTableData,
    PrefetchHooks Function()>;
typedef $$QuotesTableTableCreateCompanionBuilder = QuotesTableCompanion
    Function({
  Value<int> id,
  required String firstPart,
  required String secondPart,
});
typedef $$QuotesTableTableUpdateCompanionBuilder = QuotesTableCompanion
    Function({
  Value<int> id,
  Value<String> firstPart,
  Value<String> secondPart,
});

class $$QuotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuotesTableTable> {
  $$QuotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstPart => $composableBuilder(
      column: $table.firstPart, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondPart => $composableBuilder(
      column: $table.secondPart, builder: (column) => ColumnFilters(column));
}

class $$QuotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotesTableTable> {
  $$QuotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstPart => $composableBuilder(
      column: $table.firstPart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondPart => $composableBuilder(
      column: $table.secondPart, builder: (column) => ColumnOrderings(column));
}

class $$QuotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotesTableTable> {
  $$QuotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstPart =>
      $composableBuilder(column: $table.firstPart, builder: (column) => column);

  GeneratedColumn<String> get secondPart => $composableBuilder(
      column: $table.secondPart, builder: (column) => column);
}

class $$QuotesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuotesTableTable,
    QuotesTableData,
    $$QuotesTableTableFilterComposer,
    $$QuotesTableTableOrderingComposer,
    $$QuotesTableTableAnnotationComposer,
    $$QuotesTableTableCreateCompanionBuilder,
    $$QuotesTableTableUpdateCompanionBuilder,
    (
      QuotesTableData,
      BaseReferences<_$AppDatabase, $QuotesTableTable, QuotesTableData>
    ),
    QuotesTableData,
    PrefetchHooks Function()> {
  $$QuotesTableTableTableManager(_$AppDatabase db, $QuotesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstPart = const Value.absent(),
            Value<String> secondPart = const Value.absent(),
          }) =>
              QuotesTableCompanion(
            id: id,
            firstPart: firstPart,
            secondPart: secondPart,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstPart,
            required String secondPart,
          }) =>
              QuotesTableCompanion.insert(
            id: id,
            firstPart: firstPart,
            secondPart: secondPart,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$QuotesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuotesTableTable,
    QuotesTableData,
    $$QuotesTableTableFilterComposer,
    $$QuotesTableTableOrderingComposer,
    $$QuotesTableTableAnnotationComposer,
    $$QuotesTableTableCreateCompanionBuilder,
    $$QuotesTableTableUpdateCompanionBuilder,
    (
      QuotesTableData,
      BaseReferences<_$AppDatabase, $QuotesTableTable, QuotesTableData>
    ),
    QuotesTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserInfoTableTableTableManager get userInfoTable =>
      $$UserInfoTableTableTableManager(_db, _db.userInfoTable);
  $$QuotesTableTableTableManager get quotesTable =>
      $$QuotesTableTableTableManager(_db, _db.quotesTable);
}
