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
  static const VerificationMeta _isTrainGoMeta =
      const VerificationMeta('isTrainGo');
  @override
  late final GeneratedColumn<bool> isTrainGo = GeneratedColumn<bool>(
      'is_train_go', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_train_go" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        name,
        age,
        email,
        goal,
        sex,
        height,
        weight,
        level,
        isTrainGo
      ];
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
    if (data.containsKey('is_train_go')) {
      context.handle(
          _isTrainGoMeta,
          isTrainGo.isAcceptableOrUnknown(
              data['is_train_go']!, _isTrainGoMeta));
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
      isTrainGo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_train_go']),
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
  final bool? isTrainGo;
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
      required this.level,
      this.isTrainGo});
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
    if (!nullToAbsent || isTrainGo != null) {
      map['is_train_go'] = Variable<bool>(isTrainGo);
    }
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
      isTrainGo: isTrainGo == null && nullToAbsent
          ? const Value.absent()
          : Value(isTrainGo),
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
      isTrainGo: serializer.fromJson<bool?>(json['isTrainGo']),
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
      'isTrainGo': serializer.toJson<bool?>(isTrainGo),
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
          String? level,
          Value<bool?> isTrainGo = const Value.absent()}) =>
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
        isTrainGo: isTrainGo.present ? isTrainGo.value : this.isTrainGo,
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
      isTrainGo: data.isTrainGo.present ? data.isTrainGo.value : this.isTrainGo,
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
          ..write('level: $level, ')
          ..write('isTrainGo: $isTrainGo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name, age, email, goal, sex,
      height, weight, level, isTrainGo);
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
          other.level == this.level &&
          other.isTrainGo == this.isTrainGo);
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
  final Value<bool?> isTrainGo;
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
    this.isTrainGo = const Value.absent(),
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
    this.isTrainGo = const Value.absent(),
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
    Expression<bool>? isTrainGo,
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
      if (isTrainGo != null) 'is_train_go': isTrainGo,
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
      Value<bool?>? isTrainGo,
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
      isTrainGo: isTrainGo ?? this.isTrainGo,
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
    if (isTrainGo.present) {
      map['is_train_go'] = Variable<bool>(isTrainGo.value);
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
          ..write('isTrainGo: $isTrainGo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingPlanTableTable extends TrainingPlanTable
    with TableInfo<$TrainingPlanTableTable, TrainingPlanTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingPlanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<String> idUser = GeneratedColumn<String>(
      'id_user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayOfWeekMeta =
      const VerificationMeta('dayOfWeek');
  @override
  late final GeneratedColumn<String> dayOfWeek = GeneratedColumn<String>(
      'day_of_week', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mainMuscleMeta =
      const VerificationMeta('mainMuscle');
  @override
  late final GeneratedColumn<String> mainMuscle = GeneratedColumn<String>(
      'main_muscle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _secondaryMuscleMeta =
      const VerificationMeta('secondaryMuscle');
  @override
  late final GeneratedColumn<String> secondaryMuscle = GeneratedColumn<String>(
      'secondary_muscle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseOneMeta =
      const VerificationMeta('exerciseOne');
  @override
  late final GeneratedColumn<String> exerciseOne = GeneratedColumn<String>(
      'exercise_one', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseTwoMeta =
      const VerificationMeta('exerciseTwo');
  @override
  late final GeneratedColumn<String> exerciseTwo = GeneratedColumn<String>(
      'exercise_two', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseThreeMeta =
      const VerificationMeta('exerciseThree');
  @override
  late final GeneratedColumn<String> exerciseThree = GeneratedColumn<String>(
      'exercise_three', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseFourMeta =
      const VerificationMeta('exerciseFour');
  @override
  late final GeneratedColumn<String> exerciseFour = GeneratedColumn<String>(
      'exercise_four', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseFiveMeta =
      const VerificationMeta('exerciseFive');
  @override
  late final GeneratedColumn<String> exerciseFive = GeneratedColumn<String>(
      'exercise_five', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reqRepsMeta =
      const VerificationMeta('reqReps');
  @override
  late final GeneratedColumn<String> reqReps = GeneratedColumn<String>(
      'req_reps', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataCreatingPlanMeta =
      const VerificationMeta('dataCreatingPlan');
  @override
  late final GeneratedColumn<String> dataCreatingPlan = GeneratedColumn<String>(
      'data_creating_plan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        idUser,
        dayOfWeek,
        mainMuscle,
        secondaryMuscle,
        exerciseOne,
        exerciseTwo,
        exerciseThree,
        exerciseFour,
        exerciseFive,
        reqReps,
        dataCreatingPlan
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_plan_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrainingPlanTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
          _dayOfWeekMeta,
          dayOfWeek.isAcceptableOrUnknown(
              data['day_of_week']!, _dayOfWeekMeta));
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('main_muscle')) {
      context.handle(
          _mainMuscleMeta,
          mainMuscle.isAcceptableOrUnknown(
              data['main_muscle']!, _mainMuscleMeta));
    }
    if (data.containsKey('secondary_muscle')) {
      context.handle(
          _secondaryMuscleMeta,
          secondaryMuscle.isAcceptableOrUnknown(
              data['secondary_muscle']!, _secondaryMuscleMeta));
    }
    if (data.containsKey('exercise_one')) {
      context.handle(
          _exerciseOneMeta,
          exerciseOne.isAcceptableOrUnknown(
              data['exercise_one']!, _exerciseOneMeta));
    } else if (isInserting) {
      context.missing(_exerciseOneMeta);
    }
    if (data.containsKey('exercise_two')) {
      context.handle(
          _exerciseTwoMeta,
          exerciseTwo.isAcceptableOrUnknown(
              data['exercise_two']!, _exerciseTwoMeta));
    }
    if (data.containsKey('exercise_three')) {
      context.handle(
          _exerciseThreeMeta,
          exerciseThree.isAcceptableOrUnknown(
              data['exercise_three']!, _exerciseThreeMeta));
    }
    if (data.containsKey('exercise_four')) {
      context.handle(
          _exerciseFourMeta,
          exerciseFour.isAcceptableOrUnknown(
              data['exercise_four']!, _exerciseFourMeta));
    }
    if (data.containsKey('exercise_five')) {
      context.handle(
          _exerciseFiveMeta,
          exerciseFive.isAcceptableOrUnknown(
              data['exercise_five']!, _exerciseFiveMeta));
    }
    if (data.containsKey('req_reps')) {
      context.handle(_reqRepsMeta,
          reqReps.isAcceptableOrUnknown(data['req_reps']!, _reqRepsMeta));
    } else if (isInserting) {
      context.missing(_reqRepsMeta);
    }
    if (data.containsKey('data_creating_plan')) {
      context.handle(
          _dataCreatingPlanMeta,
          dataCreatingPlan.isAcceptableOrUnknown(
              data['data_creating_plan']!, _dataCreatingPlanMeta));
    } else if (isInserting) {
      context.missing(_dataCreatingPlanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TrainingPlanTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingPlanTableData(
      idUser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_user'])!,
      dayOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}day_of_week'])!,
      mainMuscle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_muscle']),
      secondaryMuscle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}secondary_muscle']),
      exerciseOne: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_one'])!,
      exerciseTwo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_two']),
      exerciseThree: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_three']),
      exerciseFour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_four']),
      exerciseFive: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_five']),
      reqReps: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}req_reps'])!,
      dataCreatingPlan: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}data_creating_plan'])!,
    );
  }

  @override
  $TrainingPlanTableTable createAlias(String alias) {
    return $TrainingPlanTableTable(attachedDatabase, alias);
  }
}

class TrainingPlanTableData extends DataClass
    implements Insertable<TrainingPlanTableData> {
  final String idUser;
  final String dayOfWeek;
  final String? mainMuscle;
  final String? secondaryMuscle;
  final String exerciseOne;
  final String? exerciseTwo;
  final String? exerciseThree;
  final String? exerciseFour;
  final String? exerciseFive;
  final String reqReps;
  final String dataCreatingPlan;
  const TrainingPlanTableData(
      {required this.idUser,
      required this.dayOfWeek,
      this.mainMuscle,
      this.secondaryMuscle,
      required this.exerciseOne,
      this.exerciseTwo,
      this.exerciseThree,
      this.exerciseFour,
      this.exerciseFive,
      required this.reqReps,
      required this.dataCreatingPlan});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_user'] = Variable<String>(idUser);
    map['day_of_week'] = Variable<String>(dayOfWeek);
    if (!nullToAbsent || mainMuscle != null) {
      map['main_muscle'] = Variable<String>(mainMuscle);
    }
    if (!nullToAbsent || secondaryMuscle != null) {
      map['secondary_muscle'] = Variable<String>(secondaryMuscle);
    }
    map['exercise_one'] = Variable<String>(exerciseOne);
    if (!nullToAbsent || exerciseTwo != null) {
      map['exercise_two'] = Variable<String>(exerciseTwo);
    }
    if (!nullToAbsent || exerciseThree != null) {
      map['exercise_three'] = Variable<String>(exerciseThree);
    }
    if (!nullToAbsent || exerciseFour != null) {
      map['exercise_four'] = Variable<String>(exerciseFour);
    }
    if (!nullToAbsent || exerciseFive != null) {
      map['exercise_five'] = Variable<String>(exerciseFive);
    }
    map['req_reps'] = Variable<String>(reqReps);
    map['data_creating_plan'] = Variable<String>(dataCreatingPlan);
    return map;
  }

  TrainingPlanTableCompanion toCompanion(bool nullToAbsent) {
    return TrainingPlanTableCompanion(
      idUser: Value(idUser),
      dayOfWeek: Value(dayOfWeek),
      mainMuscle: mainMuscle == null && nullToAbsent
          ? const Value.absent()
          : Value(mainMuscle),
      secondaryMuscle: secondaryMuscle == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryMuscle),
      exerciseOne: Value(exerciseOne),
      exerciseTwo: exerciseTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseTwo),
      exerciseThree: exerciseThree == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseThree),
      exerciseFour: exerciseFour == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseFour),
      exerciseFive: exerciseFive == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseFive),
      reqReps: Value(reqReps),
      dataCreatingPlan: Value(dataCreatingPlan),
    );
  }

  factory TrainingPlanTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingPlanTableData(
      idUser: serializer.fromJson<String>(json['idUser']),
      dayOfWeek: serializer.fromJson<String>(json['dayOfWeek']),
      mainMuscle: serializer.fromJson<String?>(json['mainMuscle']),
      secondaryMuscle: serializer.fromJson<String?>(json['secondaryMuscle']),
      exerciseOne: serializer.fromJson<String>(json['exerciseOne']),
      exerciseTwo: serializer.fromJson<String?>(json['exerciseTwo']),
      exerciseThree: serializer.fromJson<String?>(json['exerciseThree']),
      exerciseFour: serializer.fromJson<String?>(json['exerciseFour']),
      exerciseFive: serializer.fromJson<String?>(json['exerciseFive']),
      reqReps: serializer.fromJson<String>(json['reqReps']),
      dataCreatingPlan: serializer.fromJson<String>(json['dataCreatingPlan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUser': serializer.toJson<String>(idUser),
      'dayOfWeek': serializer.toJson<String>(dayOfWeek),
      'mainMuscle': serializer.toJson<String?>(mainMuscle),
      'secondaryMuscle': serializer.toJson<String?>(secondaryMuscle),
      'exerciseOne': serializer.toJson<String>(exerciseOne),
      'exerciseTwo': serializer.toJson<String?>(exerciseTwo),
      'exerciseThree': serializer.toJson<String?>(exerciseThree),
      'exerciseFour': serializer.toJson<String?>(exerciseFour),
      'exerciseFive': serializer.toJson<String?>(exerciseFive),
      'reqReps': serializer.toJson<String>(reqReps),
      'dataCreatingPlan': serializer.toJson<String>(dataCreatingPlan),
    };
  }

  TrainingPlanTableData copyWith(
          {String? idUser,
          String? dayOfWeek,
          Value<String?> mainMuscle = const Value.absent(),
          Value<String?> secondaryMuscle = const Value.absent(),
          String? exerciseOne,
          Value<String?> exerciseTwo = const Value.absent(),
          Value<String?> exerciseThree = const Value.absent(),
          Value<String?> exerciseFour = const Value.absent(),
          Value<String?> exerciseFive = const Value.absent(),
          String? reqReps,
          String? dataCreatingPlan}) =>
      TrainingPlanTableData(
        idUser: idUser ?? this.idUser,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        mainMuscle: mainMuscle.present ? mainMuscle.value : this.mainMuscle,
        secondaryMuscle: secondaryMuscle.present
            ? secondaryMuscle.value
            : this.secondaryMuscle,
        exerciseOne: exerciseOne ?? this.exerciseOne,
        exerciseTwo: exerciseTwo.present ? exerciseTwo.value : this.exerciseTwo,
        exerciseThree:
            exerciseThree.present ? exerciseThree.value : this.exerciseThree,
        exerciseFour:
            exerciseFour.present ? exerciseFour.value : this.exerciseFour,
        exerciseFive:
            exerciseFive.present ? exerciseFive.value : this.exerciseFive,
        reqReps: reqReps ?? this.reqReps,
        dataCreatingPlan: dataCreatingPlan ?? this.dataCreatingPlan,
      );
  TrainingPlanTableData copyWithCompanion(TrainingPlanTableCompanion data) {
    return TrainingPlanTableData(
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      mainMuscle:
          data.mainMuscle.present ? data.mainMuscle.value : this.mainMuscle,
      secondaryMuscle: data.secondaryMuscle.present
          ? data.secondaryMuscle.value
          : this.secondaryMuscle,
      exerciseOne:
          data.exerciseOne.present ? data.exerciseOne.value : this.exerciseOne,
      exerciseTwo:
          data.exerciseTwo.present ? data.exerciseTwo.value : this.exerciseTwo,
      exerciseThree: data.exerciseThree.present
          ? data.exerciseThree.value
          : this.exerciseThree,
      exerciseFour: data.exerciseFour.present
          ? data.exerciseFour.value
          : this.exerciseFour,
      exerciseFive: data.exerciseFive.present
          ? data.exerciseFive.value
          : this.exerciseFive,
      reqReps: data.reqReps.present ? data.reqReps.value : this.reqReps,
      dataCreatingPlan: data.dataCreatingPlan.present
          ? data.dataCreatingPlan.value
          : this.dataCreatingPlan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlanTableData(')
          ..write('idUser: $idUser, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('secondaryMuscle: $secondaryMuscle, ')
          ..write('exerciseOne: $exerciseOne, ')
          ..write('exerciseTwo: $exerciseTwo, ')
          ..write('exerciseThree: $exerciseThree, ')
          ..write('exerciseFour: $exerciseFour, ')
          ..write('exerciseFive: $exerciseFive, ')
          ..write('reqReps: $reqReps, ')
          ..write('dataCreatingPlan: $dataCreatingPlan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idUser,
      dayOfWeek,
      mainMuscle,
      secondaryMuscle,
      exerciseOne,
      exerciseTwo,
      exerciseThree,
      exerciseFour,
      exerciseFive,
      reqReps,
      dataCreatingPlan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingPlanTableData &&
          other.idUser == this.idUser &&
          other.dayOfWeek == this.dayOfWeek &&
          other.mainMuscle == this.mainMuscle &&
          other.secondaryMuscle == this.secondaryMuscle &&
          other.exerciseOne == this.exerciseOne &&
          other.exerciseTwo == this.exerciseTwo &&
          other.exerciseThree == this.exerciseThree &&
          other.exerciseFour == this.exerciseFour &&
          other.exerciseFive == this.exerciseFive &&
          other.reqReps == this.reqReps &&
          other.dataCreatingPlan == this.dataCreatingPlan);
}

class TrainingPlanTableCompanion
    extends UpdateCompanion<TrainingPlanTableData> {
  final Value<String> idUser;
  final Value<String> dayOfWeek;
  final Value<String?> mainMuscle;
  final Value<String?> secondaryMuscle;
  final Value<String> exerciseOne;
  final Value<String?> exerciseTwo;
  final Value<String?> exerciseThree;
  final Value<String?> exerciseFour;
  final Value<String?> exerciseFive;
  final Value<String> reqReps;
  final Value<String> dataCreatingPlan;
  final Value<int> rowid;
  const TrainingPlanTableCompanion({
    this.idUser = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.mainMuscle = const Value.absent(),
    this.secondaryMuscle = const Value.absent(),
    this.exerciseOne = const Value.absent(),
    this.exerciseTwo = const Value.absent(),
    this.exerciseThree = const Value.absent(),
    this.exerciseFour = const Value.absent(),
    this.exerciseFive = const Value.absent(),
    this.reqReps = const Value.absent(),
    this.dataCreatingPlan = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingPlanTableCompanion.insert({
    required String idUser,
    required String dayOfWeek,
    this.mainMuscle = const Value.absent(),
    this.secondaryMuscle = const Value.absent(),
    required String exerciseOne,
    this.exerciseTwo = const Value.absent(),
    this.exerciseThree = const Value.absent(),
    this.exerciseFour = const Value.absent(),
    this.exerciseFive = const Value.absent(),
    required String reqReps,
    required String dataCreatingPlan,
    this.rowid = const Value.absent(),
  })  : idUser = Value(idUser),
        dayOfWeek = Value(dayOfWeek),
        exerciseOne = Value(exerciseOne),
        reqReps = Value(reqReps),
        dataCreatingPlan = Value(dataCreatingPlan);
  static Insertable<TrainingPlanTableData> custom({
    Expression<String>? idUser,
    Expression<String>? dayOfWeek,
    Expression<String>? mainMuscle,
    Expression<String>? secondaryMuscle,
    Expression<String>? exerciseOne,
    Expression<String>? exerciseTwo,
    Expression<String>? exerciseThree,
    Expression<String>? exerciseFour,
    Expression<String>? exerciseFive,
    Expression<String>? reqReps,
    Expression<String>? dataCreatingPlan,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idUser != null) 'id_user': idUser,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (mainMuscle != null) 'main_muscle': mainMuscle,
      if (secondaryMuscle != null) 'secondary_muscle': secondaryMuscle,
      if (exerciseOne != null) 'exercise_one': exerciseOne,
      if (exerciseTwo != null) 'exercise_two': exerciseTwo,
      if (exerciseThree != null) 'exercise_three': exerciseThree,
      if (exerciseFour != null) 'exercise_four': exerciseFour,
      if (exerciseFive != null) 'exercise_five': exerciseFive,
      if (reqReps != null) 'req_reps': reqReps,
      if (dataCreatingPlan != null) 'data_creating_plan': dataCreatingPlan,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingPlanTableCompanion copyWith(
      {Value<String>? idUser,
      Value<String>? dayOfWeek,
      Value<String?>? mainMuscle,
      Value<String?>? secondaryMuscle,
      Value<String>? exerciseOne,
      Value<String?>? exerciseTwo,
      Value<String?>? exerciseThree,
      Value<String?>? exerciseFour,
      Value<String?>? exerciseFive,
      Value<String>? reqReps,
      Value<String>? dataCreatingPlan,
      Value<int>? rowid}) {
    return TrainingPlanTableCompanion(
      idUser: idUser ?? this.idUser,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
      exerciseOne: exerciseOne ?? this.exerciseOne,
      exerciseTwo: exerciseTwo ?? this.exerciseTwo,
      exerciseThree: exerciseThree ?? this.exerciseThree,
      exerciseFour: exerciseFour ?? this.exerciseFour,
      exerciseFive: exerciseFive ?? this.exerciseFive,
      reqReps: reqReps ?? this.reqReps,
      dataCreatingPlan: dataCreatingPlan ?? this.dataCreatingPlan,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUser.present) {
      map['id_user'] = Variable<String>(idUser.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<String>(dayOfWeek.value);
    }
    if (mainMuscle.present) {
      map['main_muscle'] = Variable<String>(mainMuscle.value);
    }
    if (secondaryMuscle.present) {
      map['secondary_muscle'] = Variable<String>(secondaryMuscle.value);
    }
    if (exerciseOne.present) {
      map['exercise_one'] = Variable<String>(exerciseOne.value);
    }
    if (exerciseTwo.present) {
      map['exercise_two'] = Variable<String>(exerciseTwo.value);
    }
    if (exerciseThree.present) {
      map['exercise_three'] = Variable<String>(exerciseThree.value);
    }
    if (exerciseFour.present) {
      map['exercise_four'] = Variable<String>(exerciseFour.value);
    }
    if (exerciseFive.present) {
      map['exercise_five'] = Variable<String>(exerciseFive.value);
    }
    if (reqReps.present) {
      map['req_reps'] = Variable<String>(reqReps.value);
    }
    if (dataCreatingPlan.present) {
      map['data_creating_plan'] = Variable<String>(dataCreatingPlan.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlanTableCompanion(')
          ..write('idUser: $idUser, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('secondaryMuscle: $secondaryMuscle, ')
          ..write('exerciseOne: $exerciseOne, ')
          ..write('exerciseTwo: $exerciseTwo, ')
          ..write('exerciseThree: $exerciseThree, ')
          ..write('exerciseFour: $exerciseFour, ')
          ..write('exerciseFive: $exerciseFive, ')
          ..write('reqReps: $reqReps, ')
          ..write('dataCreatingPlan: $dataCreatingPlan, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseTableTable extends ExerciseTable
    with TableInfo<$ExerciseTableTable, ExerciseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlGifMeta = const VerificationMeta('urlGif');
  @override
  late final GeneratedColumn<String> urlGif = GeneratedColumn<String>(
      'url_gif', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mainMuscleMeta =
      const VerificationMeta('mainMuscle');
  @override
  late final GeneratedColumn<String> mainMuscle = GeneratedColumn<String>(
      'main_muscle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secondaryMuscleMeta =
      const VerificationMeta('secondaryMuscle');
  @override
  late final GeneratedColumn<String> secondaryMuscle = GeneratedColumn<String>(
      'secondary_muscle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsOneMeta =
      const VerificationMeta('instructionsOne');
  @override
  late final GeneratedColumn<String> instructionsOne = GeneratedColumn<String>(
      'instructions_one', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsTwoMeta =
      const VerificationMeta('instructionsTwo');
  @override
  late final GeneratedColumn<String> instructionsTwo = GeneratedColumn<String>(
      'instructions_two', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsThreeMeta =
      const VerificationMeta('instructionsThree');
  @override
  late final GeneratedColumn<String> instructionsThree =
      GeneratedColumn<String>('instructions_three', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsFourMeta =
      const VerificationMeta('instructionsFour');
  @override
  late final GeneratedColumn<String> instructionsFour = GeneratedColumn<String>(
      'instructions_four', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _equipmentMeta =
      const VerificationMeta('equipment');
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
      'equipment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        urlGif,
        mainMuscle,
        secondaryMuscle,
        instructionsOne,
        instructionsTwo,
        instructionsThree,
        instructionsFour,
        equipment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url_gif')) {
      context.handle(_urlGifMeta,
          urlGif.isAcceptableOrUnknown(data['url_gif']!, _urlGifMeta));
    } else if (isInserting) {
      context.missing(_urlGifMeta);
    }
    if (data.containsKey('main_muscle')) {
      context.handle(
          _mainMuscleMeta,
          mainMuscle.isAcceptableOrUnknown(
              data['main_muscle']!, _mainMuscleMeta));
    } else if (isInserting) {
      context.missing(_mainMuscleMeta);
    }
    if (data.containsKey('secondary_muscle')) {
      context.handle(
          _secondaryMuscleMeta,
          secondaryMuscle.isAcceptableOrUnknown(
              data['secondary_muscle']!, _secondaryMuscleMeta));
    } else if (isInserting) {
      context.missing(_secondaryMuscleMeta);
    }
    if (data.containsKey('instructions_one')) {
      context.handle(
          _instructionsOneMeta,
          instructionsOne.isAcceptableOrUnknown(
              data['instructions_one']!, _instructionsOneMeta));
    } else if (isInserting) {
      context.missing(_instructionsOneMeta);
    }
    if (data.containsKey('instructions_two')) {
      context.handle(
          _instructionsTwoMeta,
          instructionsTwo.isAcceptableOrUnknown(
              data['instructions_two']!, _instructionsTwoMeta));
    } else if (isInserting) {
      context.missing(_instructionsTwoMeta);
    }
    if (data.containsKey('instructions_three')) {
      context.handle(
          _instructionsThreeMeta,
          instructionsThree.isAcceptableOrUnknown(
              data['instructions_three']!, _instructionsThreeMeta));
    } else if (isInserting) {
      context.missing(_instructionsThreeMeta);
    }
    if (data.containsKey('instructions_four')) {
      context.handle(
          _instructionsFourMeta,
          instructionsFour.isAcceptableOrUnknown(
              data['instructions_four']!, _instructionsFourMeta));
    } else if (isInserting) {
      context.missing(_instructionsFourMeta);
    }
    if (data.containsKey('equipment')) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta));
    } else if (isInserting) {
      context.missing(_equipmentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExerciseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      urlGif: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url_gif'])!,
      mainMuscle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_muscle'])!,
      secondaryMuscle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}secondary_muscle'])!,
      instructionsOne: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instructions_one'])!,
      instructionsTwo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instructions_two'])!,
      instructionsThree: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instructions_three'])!,
      instructionsFour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}instructions_four'])!,
      equipment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}equipment'])!,
    );
  }

  @override
  $ExerciseTableTable createAlias(String alias) {
    return $ExerciseTableTable(attachedDatabase, alias);
  }
}

class ExerciseTableData extends DataClass
    implements Insertable<ExerciseTableData> {
  final String id;
  final String name;
  final String urlGif;
  final String mainMuscle;
  final String secondaryMuscle;
  final String instructionsOne;
  final String instructionsTwo;
  final String instructionsThree;
  final String instructionsFour;
  final String equipment;
  const ExerciseTableData(
      {required this.id,
      required this.name,
      required this.urlGif,
      required this.mainMuscle,
      required this.secondaryMuscle,
      required this.instructionsOne,
      required this.instructionsTwo,
      required this.instructionsThree,
      required this.instructionsFour,
      required this.equipment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['url_gif'] = Variable<String>(urlGif);
    map['main_muscle'] = Variable<String>(mainMuscle);
    map['secondary_muscle'] = Variable<String>(secondaryMuscle);
    map['instructions_one'] = Variable<String>(instructionsOne);
    map['instructions_two'] = Variable<String>(instructionsTwo);
    map['instructions_three'] = Variable<String>(instructionsThree);
    map['instructions_four'] = Variable<String>(instructionsFour);
    map['equipment'] = Variable<String>(equipment);
    return map;
  }

  ExerciseTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseTableCompanion(
      id: Value(id),
      name: Value(name),
      urlGif: Value(urlGif),
      mainMuscle: Value(mainMuscle),
      secondaryMuscle: Value(secondaryMuscle),
      instructionsOne: Value(instructionsOne),
      instructionsTwo: Value(instructionsTwo),
      instructionsThree: Value(instructionsThree),
      instructionsFour: Value(instructionsFour),
      equipment: Value(equipment),
    );
  }

  factory ExerciseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      urlGif: serializer.fromJson<String>(json['urlGif']),
      mainMuscle: serializer.fromJson<String>(json['mainMuscle']),
      secondaryMuscle: serializer.fromJson<String>(json['secondaryMuscle']),
      instructionsOne: serializer.fromJson<String>(json['instructionsOne']),
      instructionsTwo: serializer.fromJson<String>(json['instructionsTwo']),
      instructionsThree: serializer.fromJson<String>(json['instructionsThree']),
      instructionsFour: serializer.fromJson<String>(json['instructionsFour']),
      equipment: serializer.fromJson<String>(json['equipment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'urlGif': serializer.toJson<String>(urlGif),
      'mainMuscle': serializer.toJson<String>(mainMuscle),
      'secondaryMuscle': serializer.toJson<String>(secondaryMuscle),
      'instructionsOne': serializer.toJson<String>(instructionsOne),
      'instructionsTwo': serializer.toJson<String>(instructionsTwo),
      'instructionsThree': serializer.toJson<String>(instructionsThree),
      'instructionsFour': serializer.toJson<String>(instructionsFour),
      'equipment': serializer.toJson<String>(equipment),
    };
  }

  ExerciseTableData copyWith(
          {String? id,
          String? name,
          String? urlGif,
          String? mainMuscle,
          String? secondaryMuscle,
          String? instructionsOne,
          String? instructionsTwo,
          String? instructionsThree,
          String? instructionsFour,
          String? equipment}) =>
      ExerciseTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        urlGif: urlGif ?? this.urlGif,
        mainMuscle: mainMuscle ?? this.mainMuscle,
        secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
        instructionsOne: instructionsOne ?? this.instructionsOne,
        instructionsTwo: instructionsTwo ?? this.instructionsTwo,
        instructionsThree: instructionsThree ?? this.instructionsThree,
        instructionsFour: instructionsFour ?? this.instructionsFour,
        equipment: equipment ?? this.equipment,
      );
  ExerciseTableData copyWithCompanion(ExerciseTableCompanion data) {
    return ExerciseTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      urlGif: data.urlGif.present ? data.urlGif.value : this.urlGif,
      mainMuscle:
          data.mainMuscle.present ? data.mainMuscle.value : this.mainMuscle,
      secondaryMuscle: data.secondaryMuscle.present
          ? data.secondaryMuscle.value
          : this.secondaryMuscle,
      instructionsOne: data.instructionsOne.present
          ? data.instructionsOne.value
          : this.instructionsOne,
      instructionsTwo: data.instructionsTwo.present
          ? data.instructionsTwo.value
          : this.instructionsTwo,
      instructionsThree: data.instructionsThree.present
          ? data.instructionsThree.value
          : this.instructionsThree,
      instructionsFour: data.instructionsFour.present
          ? data.instructionsFour.value
          : this.instructionsFour,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('urlGif: $urlGif, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('secondaryMuscle: $secondaryMuscle, ')
          ..write('instructionsOne: $instructionsOne, ')
          ..write('instructionsTwo: $instructionsTwo, ')
          ..write('instructionsThree: $instructionsThree, ')
          ..write('instructionsFour: $instructionsFour, ')
          ..write('equipment: $equipment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      urlGif,
      mainMuscle,
      secondaryMuscle,
      instructionsOne,
      instructionsTwo,
      instructionsThree,
      instructionsFour,
      equipment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.urlGif == this.urlGif &&
          other.mainMuscle == this.mainMuscle &&
          other.secondaryMuscle == this.secondaryMuscle &&
          other.instructionsOne == this.instructionsOne &&
          other.instructionsTwo == this.instructionsTwo &&
          other.instructionsThree == this.instructionsThree &&
          other.instructionsFour == this.instructionsFour &&
          other.equipment == this.equipment);
}

class ExerciseTableCompanion extends UpdateCompanion<ExerciseTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> urlGif;
  final Value<String> mainMuscle;
  final Value<String> secondaryMuscle;
  final Value<String> instructionsOne;
  final Value<String> instructionsTwo;
  final Value<String> instructionsThree;
  final Value<String> instructionsFour;
  final Value<String> equipment;
  final Value<int> rowid;
  const ExerciseTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.urlGif = const Value.absent(),
    this.mainMuscle = const Value.absent(),
    this.secondaryMuscle = const Value.absent(),
    this.instructionsOne = const Value.absent(),
    this.instructionsTwo = const Value.absent(),
    this.instructionsThree = const Value.absent(),
    this.instructionsFour = const Value.absent(),
    this.equipment = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseTableCompanion.insert({
    required String id,
    required String name,
    required String urlGif,
    required String mainMuscle,
    required String secondaryMuscle,
    required String instructionsOne,
    required String instructionsTwo,
    required String instructionsThree,
    required String instructionsFour,
    required String equipment,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        urlGif = Value(urlGif),
        mainMuscle = Value(mainMuscle),
        secondaryMuscle = Value(secondaryMuscle),
        instructionsOne = Value(instructionsOne),
        instructionsTwo = Value(instructionsTwo),
        instructionsThree = Value(instructionsThree),
        instructionsFour = Value(instructionsFour),
        equipment = Value(equipment);
  static Insertable<ExerciseTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? urlGif,
    Expression<String>? mainMuscle,
    Expression<String>? secondaryMuscle,
    Expression<String>? instructionsOne,
    Expression<String>? instructionsTwo,
    Expression<String>? instructionsThree,
    Expression<String>? instructionsFour,
    Expression<String>? equipment,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (urlGif != null) 'url_gif': urlGif,
      if (mainMuscle != null) 'main_muscle': mainMuscle,
      if (secondaryMuscle != null) 'secondary_muscle': secondaryMuscle,
      if (instructionsOne != null) 'instructions_one': instructionsOne,
      if (instructionsTwo != null) 'instructions_two': instructionsTwo,
      if (instructionsThree != null) 'instructions_three': instructionsThree,
      if (instructionsFour != null) 'instructions_four': instructionsFour,
      if (equipment != null) 'equipment': equipment,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? urlGif,
      Value<String>? mainMuscle,
      Value<String>? secondaryMuscle,
      Value<String>? instructionsOne,
      Value<String>? instructionsTwo,
      Value<String>? instructionsThree,
      Value<String>? instructionsFour,
      Value<String>? equipment,
      Value<int>? rowid}) {
    return ExerciseTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      urlGif: urlGif ?? this.urlGif,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      secondaryMuscle: secondaryMuscle ?? this.secondaryMuscle,
      instructionsOne: instructionsOne ?? this.instructionsOne,
      instructionsTwo: instructionsTwo ?? this.instructionsTwo,
      instructionsThree: instructionsThree ?? this.instructionsThree,
      instructionsFour: instructionsFour ?? this.instructionsFour,
      equipment: equipment ?? this.equipment,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (urlGif.present) {
      map['url_gif'] = Variable<String>(urlGif.value);
    }
    if (mainMuscle.present) {
      map['main_muscle'] = Variable<String>(mainMuscle.value);
    }
    if (secondaryMuscle.present) {
      map['secondary_muscle'] = Variable<String>(secondaryMuscle.value);
    }
    if (instructionsOne.present) {
      map['instructions_one'] = Variable<String>(instructionsOne.value);
    }
    if (instructionsTwo.present) {
      map['instructions_two'] = Variable<String>(instructionsTwo.value);
    }
    if (instructionsThree.present) {
      map['instructions_three'] = Variable<String>(instructionsThree.value);
    }
    if (instructionsFour.present) {
      map['instructions_four'] = Variable<String>(instructionsFour.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('urlGif: $urlGif, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('secondaryMuscle: $secondaryMuscle, ')
          ..write('instructionsOne: $instructionsOne, ')
          ..write('instructionsTwo: $instructionsTwo, ')
          ..write('instructionsThree: $instructionsThree, ')
          ..write('instructionsFour: $instructionsFour, ')
          ..write('equipment: $equipment, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingTableTable extends TrainingTable
    with TableInfo<$TrainingTableTable, TrainingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<String> idUser = GeneratedColumn<String>(
      'id_user', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayOfTrainingMeta =
      const VerificationMeta('dayOfTraining');
  @override
  late final GeneratedColumn<String> dayOfTraining = GeneratedColumn<String>(
      'day_of_training', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mainMuscleMeta =
      const VerificationMeta('mainMuscle');
  @override
  late final GeneratedColumn<String> mainMuscle = GeneratedColumn<String>(
      'main_muscle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseOneMeta =
      const VerificationMeta('exerciseOne');
  @override
  late final GeneratedColumn<String> exerciseOne = GeneratedColumn<String>(
      'exercise_one', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countRepsExOneMeta =
      const VerificationMeta('countRepsExOne');
  @override
  late final GeneratedColumn<int> countRepsExOne = GeneratedColumn<int>(
      'count_reps_ex_one', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxWeightExOneMeta =
      const VerificationMeta('maxWeightExOne');
  @override
  late final GeneratedColumn<String> maxWeightExOne = GeneratedColumn<String>(
      'max_weight_ex_one', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseTwoMeta =
      const VerificationMeta('exerciseTwo');
  @override
  late final GeneratedColumn<String> exerciseTwo = GeneratedColumn<String>(
      'exercise_two', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countRepsExTwoMeta =
      const VerificationMeta('countRepsExTwo');
  @override
  late final GeneratedColumn<int> countRepsExTwo = GeneratedColumn<int>(
      'count_reps_ex_two', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxWeightExTwoMeta =
      const VerificationMeta('maxWeightExTwo');
  @override
  late final GeneratedColumn<String> maxWeightExTwo = GeneratedColumn<String>(
      'max_weight_ex_two', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseThreeMeta =
      const VerificationMeta('exerciseThree');
  @override
  late final GeneratedColumn<String> exerciseThree = GeneratedColumn<String>(
      'exercise_three', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countRepsExThreeMeta =
      const VerificationMeta('countRepsExThree');
  @override
  late final GeneratedColumn<int> countRepsExThree = GeneratedColumn<int>(
      'count_reps_ex_three', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxWeightExThreeMeta =
      const VerificationMeta('maxWeightExThree');
  @override
  late final GeneratedColumn<String> maxWeightExThree = GeneratedColumn<String>(
      'max_weight_ex_three', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseFourMeta =
      const VerificationMeta('exerciseFour');
  @override
  late final GeneratedColumn<String> exerciseFour = GeneratedColumn<String>(
      'exercise_four', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countRepsExFourMeta =
      const VerificationMeta('countRepsExFour');
  @override
  late final GeneratedColumn<int> countRepsExFour = GeneratedColumn<int>(
      'count_reps_ex_four', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxWeightExFourMeta =
      const VerificationMeta('maxWeightExFour');
  @override
  late final GeneratedColumn<String> maxWeightExFour = GeneratedColumn<String>(
      'max_weight_ex_four', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exerciseFiveMeta =
      const VerificationMeta('exerciseFive');
  @override
  late final GeneratedColumn<String> exerciseFive = GeneratedColumn<String>(
      'exercise_five', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countRepsExFiveMeta =
      const VerificationMeta('countRepsExFive');
  @override
  late final GeneratedColumn<int> countRepsExFive = GeneratedColumn<int>(
      'count_reps_ex_five', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxWeightExFiveMeta =
      const VerificationMeta('maxWeightExFive');
  @override
  late final GeneratedColumn<String> maxWeightExFive = GeneratedColumn<String>(
      'max_weight_ex_five', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _percentOfTrainDoneMeta =
      const VerificationMeta('percentOfTrainDone');
  @override
  late final GeneratedColumn<int> percentOfTrainDone = GeneratedColumn<int>(
      'percent_of_train_done', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        idUser,
        dayOfTraining,
        mainMuscle,
        exerciseOne,
        countRepsExOne,
        maxWeightExOne,
        exerciseTwo,
        countRepsExTwo,
        maxWeightExTwo,
        exerciseThree,
        countRepsExThree,
        maxWeightExThree,
        exerciseFour,
        countRepsExFour,
        maxWeightExFour,
        exerciseFive,
        countRepsExFive,
        maxWeightExFive,
        percentOfTrainDone
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_table';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('day_of_training')) {
      context.handle(
          _dayOfTrainingMeta,
          dayOfTraining.isAcceptableOrUnknown(
              data['day_of_training']!, _dayOfTrainingMeta));
    } else if (isInserting) {
      context.missing(_dayOfTrainingMeta);
    }
    if (data.containsKey('main_muscle')) {
      context.handle(
          _mainMuscleMeta,
          mainMuscle.isAcceptableOrUnknown(
              data['main_muscle']!, _mainMuscleMeta));
    }
    if (data.containsKey('exercise_one')) {
      context.handle(
          _exerciseOneMeta,
          exerciseOne.isAcceptableOrUnknown(
              data['exercise_one']!, _exerciseOneMeta));
    } else if (isInserting) {
      context.missing(_exerciseOneMeta);
    }
    if (data.containsKey('count_reps_ex_one')) {
      context.handle(
          _countRepsExOneMeta,
          countRepsExOne.isAcceptableOrUnknown(
              data['count_reps_ex_one']!, _countRepsExOneMeta));
    } else if (isInserting) {
      context.missing(_countRepsExOneMeta);
    }
    if (data.containsKey('max_weight_ex_one')) {
      context.handle(
          _maxWeightExOneMeta,
          maxWeightExOne.isAcceptableOrUnknown(
              data['max_weight_ex_one']!, _maxWeightExOneMeta));
    } else if (isInserting) {
      context.missing(_maxWeightExOneMeta);
    }
    if (data.containsKey('exercise_two')) {
      context.handle(
          _exerciseTwoMeta,
          exerciseTwo.isAcceptableOrUnknown(
              data['exercise_two']!, _exerciseTwoMeta));
    }
    if (data.containsKey('count_reps_ex_two')) {
      context.handle(
          _countRepsExTwoMeta,
          countRepsExTwo.isAcceptableOrUnknown(
              data['count_reps_ex_two']!, _countRepsExTwoMeta));
    }
    if (data.containsKey('max_weight_ex_two')) {
      context.handle(
          _maxWeightExTwoMeta,
          maxWeightExTwo.isAcceptableOrUnknown(
              data['max_weight_ex_two']!, _maxWeightExTwoMeta));
    }
    if (data.containsKey('exercise_three')) {
      context.handle(
          _exerciseThreeMeta,
          exerciseThree.isAcceptableOrUnknown(
              data['exercise_three']!, _exerciseThreeMeta));
    }
    if (data.containsKey('count_reps_ex_three')) {
      context.handle(
          _countRepsExThreeMeta,
          countRepsExThree.isAcceptableOrUnknown(
              data['count_reps_ex_three']!, _countRepsExThreeMeta));
    }
    if (data.containsKey('max_weight_ex_three')) {
      context.handle(
          _maxWeightExThreeMeta,
          maxWeightExThree.isAcceptableOrUnknown(
              data['max_weight_ex_three']!, _maxWeightExThreeMeta));
    }
    if (data.containsKey('exercise_four')) {
      context.handle(
          _exerciseFourMeta,
          exerciseFour.isAcceptableOrUnknown(
              data['exercise_four']!, _exerciseFourMeta));
    }
    if (data.containsKey('count_reps_ex_four')) {
      context.handle(
          _countRepsExFourMeta,
          countRepsExFour.isAcceptableOrUnknown(
              data['count_reps_ex_four']!, _countRepsExFourMeta));
    }
    if (data.containsKey('max_weight_ex_four')) {
      context.handle(
          _maxWeightExFourMeta,
          maxWeightExFour.isAcceptableOrUnknown(
              data['max_weight_ex_four']!, _maxWeightExFourMeta));
    }
    if (data.containsKey('exercise_five')) {
      context.handle(
          _exerciseFiveMeta,
          exerciseFive.isAcceptableOrUnknown(
              data['exercise_five']!, _exerciseFiveMeta));
    }
    if (data.containsKey('count_reps_ex_five')) {
      context.handle(
          _countRepsExFiveMeta,
          countRepsExFive.isAcceptableOrUnknown(
              data['count_reps_ex_five']!, _countRepsExFiveMeta));
    }
    if (data.containsKey('max_weight_ex_five')) {
      context.handle(
          _maxWeightExFiveMeta,
          maxWeightExFive.isAcceptableOrUnknown(
              data['max_weight_ex_five']!, _maxWeightExFiveMeta));
    }
    if (data.containsKey('percent_of_train_done')) {
      context.handle(
          _percentOfTrainDoneMeta,
          percentOfTrainDone.isAcceptableOrUnknown(
              data['percent_of_train_done']!, _percentOfTrainDoneMeta));
    } else if (isInserting) {
      context.missing(_percentOfTrainDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TrainingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingTableData(
      idUser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_user'])!,
      dayOfTraining: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}day_of_training'])!,
      mainMuscle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_muscle']),
      exerciseOne: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_one'])!,
      countRepsExOne: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_reps_ex_one'])!,
      maxWeightExOne: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}max_weight_ex_one'])!,
      exerciseTwo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_two']),
      countRepsExTwo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_reps_ex_two']),
      maxWeightExTwo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}max_weight_ex_two']),
      exerciseThree: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_three']),
      countRepsExThree: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}count_reps_ex_three']),
      maxWeightExThree: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}max_weight_ex_three']),
      exerciseFour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_four']),
      countRepsExFour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_reps_ex_four']),
      maxWeightExFour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}max_weight_ex_four']),
      exerciseFive: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_five']),
      countRepsExFive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count_reps_ex_five']),
      maxWeightExFive: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}max_weight_ex_five']),
      percentOfTrainDone: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}percent_of_train_done'])!,
    );
  }

  @override
  $TrainingTableTable createAlias(String alias) {
    return $TrainingTableTable(attachedDatabase, alias);
  }
}

class TrainingTableData extends DataClass
    implements Insertable<TrainingTableData> {
  final String idUser;
  final String dayOfTraining;
  final String? mainMuscle;
  final String exerciseOne;
  final int countRepsExOne;
  final String maxWeightExOne;
  final String? exerciseTwo;
  final int? countRepsExTwo;
  final String? maxWeightExTwo;
  final String? exerciseThree;
  final int? countRepsExThree;
  final String? maxWeightExThree;
  final String? exerciseFour;
  final int? countRepsExFour;
  final String? maxWeightExFour;
  final String? exerciseFive;
  final int? countRepsExFive;
  final String? maxWeightExFive;
  final int percentOfTrainDone;
  const TrainingTableData(
      {required this.idUser,
      required this.dayOfTraining,
      this.mainMuscle,
      required this.exerciseOne,
      required this.countRepsExOne,
      required this.maxWeightExOne,
      this.exerciseTwo,
      this.countRepsExTwo,
      this.maxWeightExTwo,
      this.exerciseThree,
      this.countRepsExThree,
      this.maxWeightExThree,
      this.exerciseFour,
      this.countRepsExFour,
      this.maxWeightExFour,
      this.exerciseFive,
      this.countRepsExFive,
      this.maxWeightExFive,
      required this.percentOfTrainDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_user'] = Variable<String>(idUser);
    map['day_of_training'] = Variable<String>(dayOfTraining);
    if (!nullToAbsent || mainMuscle != null) {
      map['main_muscle'] = Variable<String>(mainMuscle);
    }
    map['exercise_one'] = Variable<String>(exerciseOne);
    map['count_reps_ex_one'] = Variable<int>(countRepsExOne);
    map['max_weight_ex_one'] = Variable<String>(maxWeightExOne);
    if (!nullToAbsent || exerciseTwo != null) {
      map['exercise_two'] = Variable<String>(exerciseTwo);
    }
    if (!nullToAbsent || countRepsExTwo != null) {
      map['count_reps_ex_two'] = Variable<int>(countRepsExTwo);
    }
    if (!nullToAbsent || maxWeightExTwo != null) {
      map['max_weight_ex_two'] = Variable<String>(maxWeightExTwo);
    }
    if (!nullToAbsent || exerciseThree != null) {
      map['exercise_three'] = Variable<String>(exerciseThree);
    }
    if (!nullToAbsent || countRepsExThree != null) {
      map['count_reps_ex_three'] = Variable<int>(countRepsExThree);
    }
    if (!nullToAbsent || maxWeightExThree != null) {
      map['max_weight_ex_three'] = Variable<String>(maxWeightExThree);
    }
    if (!nullToAbsent || exerciseFour != null) {
      map['exercise_four'] = Variable<String>(exerciseFour);
    }
    if (!nullToAbsent || countRepsExFour != null) {
      map['count_reps_ex_four'] = Variable<int>(countRepsExFour);
    }
    if (!nullToAbsent || maxWeightExFour != null) {
      map['max_weight_ex_four'] = Variable<String>(maxWeightExFour);
    }
    if (!nullToAbsent || exerciseFive != null) {
      map['exercise_five'] = Variable<String>(exerciseFive);
    }
    if (!nullToAbsent || countRepsExFive != null) {
      map['count_reps_ex_five'] = Variable<int>(countRepsExFive);
    }
    if (!nullToAbsent || maxWeightExFive != null) {
      map['max_weight_ex_five'] = Variable<String>(maxWeightExFive);
    }
    map['percent_of_train_done'] = Variable<int>(percentOfTrainDone);
    return map;
  }

  TrainingTableCompanion toCompanion(bool nullToAbsent) {
    return TrainingTableCompanion(
      idUser: Value(idUser),
      dayOfTraining: Value(dayOfTraining),
      mainMuscle: mainMuscle == null && nullToAbsent
          ? const Value.absent()
          : Value(mainMuscle),
      exerciseOne: Value(exerciseOne),
      countRepsExOne: Value(countRepsExOne),
      maxWeightExOne: Value(maxWeightExOne),
      exerciseTwo: exerciseTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseTwo),
      countRepsExTwo: countRepsExTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(countRepsExTwo),
      maxWeightExTwo: maxWeightExTwo == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeightExTwo),
      exerciseThree: exerciseThree == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseThree),
      countRepsExThree: countRepsExThree == null && nullToAbsent
          ? const Value.absent()
          : Value(countRepsExThree),
      maxWeightExThree: maxWeightExThree == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeightExThree),
      exerciseFour: exerciseFour == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseFour),
      countRepsExFour: countRepsExFour == null && nullToAbsent
          ? const Value.absent()
          : Value(countRepsExFour),
      maxWeightExFour: maxWeightExFour == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeightExFour),
      exerciseFive: exerciseFive == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseFive),
      countRepsExFive: countRepsExFive == null && nullToAbsent
          ? const Value.absent()
          : Value(countRepsExFive),
      maxWeightExFive: maxWeightExFive == null && nullToAbsent
          ? const Value.absent()
          : Value(maxWeightExFive),
      percentOfTrainDone: Value(percentOfTrainDone),
    );
  }

  factory TrainingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingTableData(
      idUser: serializer.fromJson<String>(json['idUser']),
      dayOfTraining: serializer.fromJson<String>(json['dayOfTraining']),
      mainMuscle: serializer.fromJson<String?>(json['mainMuscle']),
      exerciseOne: serializer.fromJson<String>(json['exerciseOne']),
      countRepsExOne: serializer.fromJson<int>(json['countRepsExOne']),
      maxWeightExOne: serializer.fromJson<String>(json['maxWeightExOne']),
      exerciseTwo: serializer.fromJson<String?>(json['exerciseTwo']),
      countRepsExTwo: serializer.fromJson<int?>(json['countRepsExTwo']),
      maxWeightExTwo: serializer.fromJson<String?>(json['maxWeightExTwo']),
      exerciseThree: serializer.fromJson<String?>(json['exerciseThree']),
      countRepsExThree: serializer.fromJson<int?>(json['countRepsExThree']),
      maxWeightExThree: serializer.fromJson<String?>(json['maxWeightExThree']),
      exerciseFour: serializer.fromJson<String?>(json['exerciseFour']),
      countRepsExFour: serializer.fromJson<int?>(json['countRepsExFour']),
      maxWeightExFour: serializer.fromJson<String?>(json['maxWeightExFour']),
      exerciseFive: serializer.fromJson<String?>(json['exerciseFive']),
      countRepsExFive: serializer.fromJson<int?>(json['countRepsExFive']),
      maxWeightExFive: serializer.fromJson<String?>(json['maxWeightExFive']),
      percentOfTrainDone: serializer.fromJson<int>(json['percentOfTrainDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUser': serializer.toJson<String>(idUser),
      'dayOfTraining': serializer.toJson<String>(dayOfTraining),
      'mainMuscle': serializer.toJson<String?>(mainMuscle),
      'exerciseOne': serializer.toJson<String>(exerciseOne),
      'countRepsExOne': serializer.toJson<int>(countRepsExOne),
      'maxWeightExOne': serializer.toJson<String>(maxWeightExOne),
      'exerciseTwo': serializer.toJson<String?>(exerciseTwo),
      'countRepsExTwo': serializer.toJson<int?>(countRepsExTwo),
      'maxWeightExTwo': serializer.toJson<String?>(maxWeightExTwo),
      'exerciseThree': serializer.toJson<String?>(exerciseThree),
      'countRepsExThree': serializer.toJson<int?>(countRepsExThree),
      'maxWeightExThree': serializer.toJson<String?>(maxWeightExThree),
      'exerciseFour': serializer.toJson<String?>(exerciseFour),
      'countRepsExFour': serializer.toJson<int?>(countRepsExFour),
      'maxWeightExFour': serializer.toJson<String?>(maxWeightExFour),
      'exerciseFive': serializer.toJson<String?>(exerciseFive),
      'countRepsExFive': serializer.toJson<int?>(countRepsExFive),
      'maxWeightExFive': serializer.toJson<String?>(maxWeightExFive),
      'percentOfTrainDone': serializer.toJson<int>(percentOfTrainDone),
    };
  }

  TrainingTableData copyWith(
          {String? idUser,
          String? dayOfTraining,
          Value<String?> mainMuscle = const Value.absent(),
          String? exerciseOne,
          int? countRepsExOne,
          String? maxWeightExOne,
          Value<String?> exerciseTwo = const Value.absent(),
          Value<int?> countRepsExTwo = const Value.absent(),
          Value<String?> maxWeightExTwo = const Value.absent(),
          Value<String?> exerciseThree = const Value.absent(),
          Value<int?> countRepsExThree = const Value.absent(),
          Value<String?> maxWeightExThree = const Value.absent(),
          Value<String?> exerciseFour = const Value.absent(),
          Value<int?> countRepsExFour = const Value.absent(),
          Value<String?> maxWeightExFour = const Value.absent(),
          Value<String?> exerciseFive = const Value.absent(),
          Value<int?> countRepsExFive = const Value.absent(),
          Value<String?> maxWeightExFive = const Value.absent(),
          int? percentOfTrainDone}) =>
      TrainingTableData(
        idUser: idUser ?? this.idUser,
        dayOfTraining: dayOfTraining ?? this.dayOfTraining,
        mainMuscle: mainMuscle.present ? mainMuscle.value : this.mainMuscle,
        exerciseOne: exerciseOne ?? this.exerciseOne,
        countRepsExOne: countRepsExOne ?? this.countRepsExOne,
        maxWeightExOne: maxWeightExOne ?? this.maxWeightExOne,
        exerciseTwo: exerciseTwo.present ? exerciseTwo.value : this.exerciseTwo,
        countRepsExTwo:
            countRepsExTwo.present ? countRepsExTwo.value : this.countRepsExTwo,
        maxWeightExTwo:
            maxWeightExTwo.present ? maxWeightExTwo.value : this.maxWeightExTwo,
        exerciseThree:
            exerciseThree.present ? exerciseThree.value : this.exerciseThree,
        countRepsExThree: countRepsExThree.present
            ? countRepsExThree.value
            : this.countRepsExThree,
        maxWeightExThree: maxWeightExThree.present
            ? maxWeightExThree.value
            : this.maxWeightExThree,
        exerciseFour:
            exerciseFour.present ? exerciseFour.value : this.exerciseFour,
        countRepsExFour: countRepsExFour.present
            ? countRepsExFour.value
            : this.countRepsExFour,
        maxWeightExFour: maxWeightExFour.present
            ? maxWeightExFour.value
            : this.maxWeightExFour,
        exerciseFive:
            exerciseFive.present ? exerciseFive.value : this.exerciseFive,
        countRepsExFive: countRepsExFive.present
            ? countRepsExFive.value
            : this.countRepsExFive,
        maxWeightExFive: maxWeightExFive.present
            ? maxWeightExFive.value
            : this.maxWeightExFive,
        percentOfTrainDone: percentOfTrainDone ?? this.percentOfTrainDone,
      );
  TrainingTableData copyWithCompanion(TrainingTableCompanion data) {
    return TrainingTableData(
      idUser: data.idUser.present ? data.idUser.value : this.idUser,
      dayOfTraining: data.dayOfTraining.present
          ? data.dayOfTraining.value
          : this.dayOfTraining,
      mainMuscle:
          data.mainMuscle.present ? data.mainMuscle.value : this.mainMuscle,
      exerciseOne:
          data.exerciseOne.present ? data.exerciseOne.value : this.exerciseOne,
      countRepsExOne: data.countRepsExOne.present
          ? data.countRepsExOne.value
          : this.countRepsExOne,
      maxWeightExOne: data.maxWeightExOne.present
          ? data.maxWeightExOne.value
          : this.maxWeightExOne,
      exerciseTwo:
          data.exerciseTwo.present ? data.exerciseTwo.value : this.exerciseTwo,
      countRepsExTwo: data.countRepsExTwo.present
          ? data.countRepsExTwo.value
          : this.countRepsExTwo,
      maxWeightExTwo: data.maxWeightExTwo.present
          ? data.maxWeightExTwo.value
          : this.maxWeightExTwo,
      exerciseThree: data.exerciseThree.present
          ? data.exerciseThree.value
          : this.exerciseThree,
      countRepsExThree: data.countRepsExThree.present
          ? data.countRepsExThree.value
          : this.countRepsExThree,
      maxWeightExThree: data.maxWeightExThree.present
          ? data.maxWeightExThree.value
          : this.maxWeightExThree,
      exerciseFour: data.exerciseFour.present
          ? data.exerciseFour.value
          : this.exerciseFour,
      countRepsExFour: data.countRepsExFour.present
          ? data.countRepsExFour.value
          : this.countRepsExFour,
      maxWeightExFour: data.maxWeightExFour.present
          ? data.maxWeightExFour.value
          : this.maxWeightExFour,
      exerciseFive: data.exerciseFive.present
          ? data.exerciseFive.value
          : this.exerciseFive,
      countRepsExFive: data.countRepsExFive.present
          ? data.countRepsExFive.value
          : this.countRepsExFive,
      maxWeightExFive: data.maxWeightExFive.present
          ? data.maxWeightExFive.value
          : this.maxWeightExFive,
      percentOfTrainDone: data.percentOfTrainDone.present
          ? data.percentOfTrainDone.value
          : this.percentOfTrainDone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTableData(')
          ..write('idUser: $idUser, ')
          ..write('dayOfTraining: $dayOfTraining, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('exerciseOne: $exerciseOne, ')
          ..write('countRepsExOne: $countRepsExOne, ')
          ..write('maxWeightExOne: $maxWeightExOne, ')
          ..write('exerciseTwo: $exerciseTwo, ')
          ..write('countRepsExTwo: $countRepsExTwo, ')
          ..write('maxWeightExTwo: $maxWeightExTwo, ')
          ..write('exerciseThree: $exerciseThree, ')
          ..write('countRepsExThree: $countRepsExThree, ')
          ..write('maxWeightExThree: $maxWeightExThree, ')
          ..write('exerciseFour: $exerciseFour, ')
          ..write('countRepsExFour: $countRepsExFour, ')
          ..write('maxWeightExFour: $maxWeightExFour, ')
          ..write('exerciseFive: $exerciseFive, ')
          ..write('countRepsExFive: $countRepsExFive, ')
          ..write('maxWeightExFive: $maxWeightExFive, ')
          ..write('percentOfTrainDone: $percentOfTrainDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idUser,
      dayOfTraining,
      mainMuscle,
      exerciseOne,
      countRepsExOne,
      maxWeightExOne,
      exerciseTwo,
      countRepsExTwo,
      maxWeightExTwo,
      exerciseThree,
      countRepsExThree,
      maxWeightExThree,
      exerciseFour,
      countRepsExFour,
      maxWeightExFour,
      exerciseFive,
      countRepsExFive,
      maxWeightExFive,
      percentOfTrainDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingTableData &&
          other.idUser == this.idUser &&
          other.dayOfTraining == this.dayOfTraining &&
          other.mainMuscle == this.mainMuscle &&
          other.exerciseOne == this.exerciseOne &&
          other.countRepsExOne == this.countRepsExOne &&
          other.maxWeightExOne == this.maxWeightExOne &&
          other.exerciseTwo == this.exerciseTwo &&
          other.countRepsExTwo == this.countRepsExTwo &&
          other.maxWeightExTwo == this.maxWeightExTwo &&
          other.exerciseThree == this.exerciseThree &&
          other.countRepsExThree == this.countRepsExThree &&
          other.maxWeightExThree == this.maxWeightExThree &&
          other.exerciseFour == this.exerciseFour &&
          other.countRepsExFour == this.countRepsExFour &&
          other.maxWeightExFour == this.maxWeightExFour &&
          other.exerciseFive == this.exerciseFive &&
          other.countRepsExFive == this.countRepsExFive &&
          other.maxWeightExFive == this.maxWeightExFive &&
          other.percentOfTrainDone == this.percentOfTrainDone);
}

class TrainingTableCompanion extends UpdateCompanion<TrainingTableData> {
  final Value<String> idUser;
  final Value<String> dayOfTraining;
  final Value<String?> mainMuscle;
  final Value<String> exerciseOne;
  final Value<int> countRepsExOne;
  final Value<String> maxWeightExOne;
  final Value<String?> exerciseTwo;
  final Value<int?> countRepsExTwo;
  final Value<String?> maxWeightExTwo;
  final Value<String?> exerciseThree;
  final Value<int?> countRepsExThree;
  final Value<String?> maxWeightExThree;
  final Value<String?> exerciseFour;
  final Value<int?> countRepsExFour;
  final Value<String?> maxWeightExFour;
  final Value<String?> exerciseFive;
  final Value<int?> countRepsExFive;
  final Value<String?> maxWeightExFive;
  final Value<int> percentOfTrainDone;
  final Value<int> rowid;
  const TrainingTableCompanion({
    this.idUser = const Value.absent(),
    this.dayOfTraining = const Value.absent(),
    this.mainMuscle = const Value.absent(),
    this.exerciseOne = const Value.absent(),
    this.countRepsExOne = const Value.absent(),
    this.maxWeightExOne = const Value.absent(),
    this.exerciseTwo = const Value.absent(),
    this.countRepsExTwo = const Value.absent(),
    this.maxWeightExTwo = const Value.absent(),
    this.exerciseThree = const Value.absent(),
    this.countRepsExThree = const Value.absent(),
    this.maxWeightExThree = const Value.absent(),
    this.exerciseFour = const Value.absent(),
    this.countRepsExFour = const Value.absent(),
    this.maxWeightExFour = const Value.absent(),
    this.exerciseFive = const Value.absent(),
    this.countRepsExFive = const Value.absent(),
    this.maxWeightExFive = const Value.absent(),
    this.percentOfTrainDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingTableCompanion.insert({
    required String idUser,
    required String dayOfTraining,
    this.mainMuscle = const Value.absent(),
    required String exerciseOne,
    required int countRepsExOne,
    required String maxWeightExOne,
    this.exerciseTwo = const Value.absent(),
    this.countRepsExTwo = const Value.absent(),
    this.maxWeightExTwo = const Value.absent(),
    this.exerciseThree = const Value.absent(),
    this.countRepsExThree = const Value.absent(),
    this.maxWeightExThree = const Value.absent(),
    this.exerciseFour = const Value.absent(),
    this.countRepsExFour = const Value.absent(),
    this.maxWeightExFour = const Value.absent(),
    this.exerciseFive = const Value.absent(),
    this.countRepsExFive = const Value.absent(),
    this.maxWeightExFive = const Value.absent(),
    required int percentOfTrainDone,
    this.rowid = const Value.absent(),
  })  : idUser = Value(idUser),
        dayOfTraining = Value(dayOfTraining),
        exerciseOne = Value(exerciseOne),
        countRepsExOne = Value(countRepsExOne),
        maxWeightExOne = Value(maxWeightExOne),
        percentOfTrainDone = Value(percentOfTrainDone);
  static Insertable<TrainingTableData> custom({
    Expression<String>? idUser,
    Expression<String>? dayOfTraining,
    Expression<String>? mainMuscle,
    Expression<String>? exerciseOne,
    Expression<int>? countRepsExOne,
    Expression<String>? maxWeightExOne,
    Expression<String>? exerciseTwo,
    Expression<int>? countRepsExTwo,
    Expression<String>? maxWeightExTwo,
    Expression<String>? exerciseThree,
    Expression<int>? countRepsExThree,
    Expression<String>? maxWeightExThree,
    Expression<String>? exerciseFour,
    Expression<int>? countRepsExFour,
    Expression<String>? maxWeightExFour,
    Expression<String>? exerciseFive,
    Expression<int>? countRepsExFive,
    Expression<String>? maxWeightExFive,
    Expression<int>? percentOfTrainDone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idUser != null) 'id_user': idUser,
      if (dayOfTraining != null) 'day_of_training': dayOfTraining,
      if (mainMuscle != null) 'main_muscle': mainMuscle,
      if (exerciseOne != null) 'exercise_one': exerciseOne,
      if (countRepsExOne != null) 'count_reps_ex_one': countRepsExOne,
      if (maxWeightExOne != null) 'max_weight_ex_one': maxWeightExOne,
      if (exerciseTwo != null) 'exercise_two': exerciseTwo,
      if (countRepsExTwo != null) 'count_reps_ex_two': countRepsExTwo,
      if (maxWeightExTwo != null) 'max_weight_ex_two': maxWeightExTwo,
      if (exerciseThree != null) 'exercise_three': exerciseThree,
      if (countRepsExThree != null) 'count_reps_ex_three': countRepsExThree,
      if (maxWeightExThree != null) 'max_weight_ex_three': maxWeightExThree,
      if (exerciseFour != null) 'exercise_four': exerciseFour,
      if (countRepsExFour != null) 'count_reps_ex_four': countRepsExFour,
      if (maxWeightExFour != null) 'max_weight_ex_four': maxWeightExFour,
      if (exerciseFive != null) 'exercise_five': exerciseFive,
      if (countRepsExFive != null) 'count_reps_ex_five': countRepsExFive,
      if (maxWeightExFive != null) 'max_weight_ex_five': maxWeightExFive,
      if (percentOfTrainDone != null)
        'percent_of_train_done': percentOfTrainDone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingTableCompanion copyWith(
      {Value<String>? idUser,
      Value<String>? dayOfTraining,
      Value<String?>? mainMuscle,
      Value<String>? exerciseOne,
      Value<int>? countRepsExOne,
      Value<String>? maxWeightExOne,
      Value<String?>? exerciseTwo,
      Value<int?>? countRepsExTwo,
      Value<String?>? maxWeightExTwo,
      Value<String?>? exerciseThree,
      Value<int?>? countRepsExThree,
      Value<String?>? maxWeightExThree,
      Value<String?>? exerciseFour,
      Value<int?>? countRepsExFour,
      Value<String?>? maxWeightExFour,
      Value<String?>? exerciseFive,
      Value<int?>? countRepsExFive,
      Value<String?>? maxWeightExFive,
      Value<int>? percentOfTrainDone,
      Value<int>? rowid}) {
    return TrainingTableCompanion(
      idUser: idUser ?? this.idUser,
      dayOfTraining: dayOfTraining ?? this.dayOfTraining,
      mainMuscle: mainMuscle ?? this.mainMuscle,
      exerciseOne: exerciseOne ?? this.exerciseOne,
      countRepsExOne: countRepsExOne ?? this.countRepsExOne,
      maxWeightExOne: maxWeightExOne ?? this.maxWeightExOne,
      exerciseTwo: exerciseTwo ?? this.exerciseTwo,
      countRepsExTwo: countRepsExTwo ?? this.countRepsExTwo,
      maxWeightExTwo: maxWeightExTwo ?? this.maxWeightExTwo,
      exerciseThree: exerciseThree ?? this.exerciseThree,
      countRepsExThree: countRepsExThree ?? this.countRepsExThree,
      maxWeightExThree: maxWeightExThree ?? this.maxWeightExThree,
      exerciseFour: exerciseFour ?? this.exerciseFour,
      countRepsExFour: countRepsExFour ?? this.countRepsExFour,
      maxWeightExFour: maxWeightExFour ?? this.maxWeightExFour,
      exerciseFive: exerciseFive ?? this.exerciseFive,
      countRepsExFive: countRepsExFive ?? this.countRepsExFive,
      maxWeightExFive: maxWeightExFive ?? this.maxWeightExFive,
      percentOfTrainDone: percentOfTrainDone ?? this.percentOfTrainDone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUser.present) {
      map['id_user'] = Variable<String>(idUser.value);
    }
    if (dayOfTraining.present) {
      map['day_of_training'] = Variable<String>(dayOfTraining.value);
    }
    if (mainMuscle.present) {
      map['main_muscle'] = Variable<String>(mainMuscle.value);
    }
    if (exerciseOne.present) {
      map['exercise_one'] = Variable<String>(exerciseOne.value);
    }
    if (countRepsExOne.present) {
      map['count_reps_ex_one'] = Variable<int>(countRepsExOne.value);
    }
    if (maxWeightExOne.present) {
      map['max_weight_ex_one'] = Variable<String>(maxWeightExOne.value);
    }
    if (exerciseTwo.present) {
      map['exercise_two'] = Variable<String>(exerciseTwo.value);
    }
    if (countRepsExTwo.present) {
      map['count_reps_ex_two'] = Variable<int>(countRepsExTwo.value);
    }
    if (maxWeightExTwo.present) {
      map['max_weight_ex_two'] = Variable<String>(maxWeightExTwo.value);
    }
    if (exerciseThree.present) {
      map['exercise_three'] = Variable<String>(exerciseThree.value);
    }
    if (countRepsExThree.present) {
      map['count_reps_ex_three'] = Variable<int>(countRepsExThree.value);
    }
    if (maxWeightExThree.present) {
      map['max_weight_ex_three'] = Variable<String>(maxWeightExThree.value);
    }
    if (exerciseFour.present) {
      map['exercise_four'] = Variable<String>(exerciseFour.value);
    }
    if (countRepsExFour.present) {
      map['count_reps_ex_four'] = Variable<int>(countRepsExFour.value);
    }
    if (maxWeightExFour.present) {
      map['max_weight_ex_four'] = Variable<String>(maxWeightExFour.value);
    }
    if (exerciseFive.present) {
      map['exercise_five'] = Variable<String>(exerciseFive.value);
    }
    if (countRepsExFive.present) {
      map['count_reps_ex_five'] = Variable<int>(countRepsExFive.value);
    }
    if (maxWeightExFive.present) {
      map['max_weight_ex_five'] = Variable<String>(maxWeightExFive.value);
    }
    if (percentOfTrainDone.present) {
      map['percent_of_train_done'] = Variable<int>(percentOfTrainDone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTableCompanion(')
          ..write('idUser: $idUser, ')
          ..write('dayOfTraining: $dayOfTraining, ')
          ..write('mainMuscle: $mainMuscle, ')
          ..write('exerciseOne: $exerciseOne, ')
          ..write('countRepsExOne: $countRepsExOne, ')
          ..write('maxWeightExOne: $maxWeightExOne, ')
          ..write('exerciseTwo: $exerciseTwo, ')
          ..write('countRepsExTwo: $countRepsExTwo, ')
          ..write('maxWeightExTwo: $maxWeightExTwo, ')
          ..write('exerciseThree: $exerciseThree, ')
          ..write('countRepsExThree: $countRepsExThree, ')
          ..write('maxWeightExThree: $maxWeightExThree, ')
          ..write('exerciseFour: $exerciseFour, ')
          ..write('countRepsExFour: $countRepsExFour, ')
          ..write('maxWeightExFour: $maxWeightExFour, ')
          ..write('exerciseFive: $exerciseFive, ')
          ..write('countRepsExFive: $countRepsExFive, ')
          ..write('maxWeightExFive: $maxWeightExFive, ')
          ..write('percentOfTrainDone: $percentOfTrainDone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserInfoTableTable userInfoTable = $UserInfoTableTable(this);
  late final $TrainingPlanTableTable trainingPlanTable =
      $TrainingPlanTableTable(this);
  late final $ExerciseTableTable exerciseTable = $ExerciseTableTable(this);
  late final $TrainingTableTable trainingTable = $TrainingTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userInfoTable, trainingPlanTable, exerciseTable, trainingTable];
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
  Value<bool?> isTrainGo,
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
  Value<bool?> isTrainGo,
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

  ColumnFilters<bool> get isTrainGo => $composableBuilder(
      column: $table.isTrainGo, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<bool> get isTrainGo => $composableBuilder(
      column: $table.isTrainGo, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<bool> get isTrainGo =>
      $composableBuilder(column: $table.isTrainGo, builder: (column) => column);
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
            Value<bool?> isTrainGo = const Value.absent(),
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
            isTrainGo: isTrainGo,
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
            Value<bool?> isTrainGo = const Value.absent(),
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
            isTrainGo: isTrainGo,
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
typedef $$TrainingPlanTableTableCreateCompanionBuilder
    = TrainingPlanTableCompanion Function({
  required String idUser,
  required String dayOfWeek,
  Value<String?> mainMuscle,
  Value<String?> secondaryMuscle,
  required String exerciseOne,
  Value<String?> exerciseTwo,
  Value<String?> exerciseThree,
  Value<String?> exerciseFour,
  Value<String?> exerciseFive,
  required String reqReps,
  required String dataCreatingPlan,
  Value<int> rowid,
});
typedef $$TrainingPlanTableTableUpdateCompanionBuilder
    = TrainingPlanTableCompanion Function({
  Value<String> idUser,
  Value<String> dayOfWeek,
  Value<String?> mainMuscle,
  Value<String?> secondaryMuscle,
  Value<String> exerciseOne,
  Value<String?> exerciseTwo,
  Value<String?> exerciseThree,
  Value<String?> exerciseFour,
  Value<String?> exerciseFive,
  Value<String> reqReps,
  Value<String> dataCreatingPlan,
  Value<int> rowid,
});

class $$TrainingPlanTableTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingPlanTableTable> {
  $$TrainingPlanTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idUser => $composableBuilder(
      column: $table.idUser, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reqReps => $composableBuilder(
      column: $table.reqReps, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataCreatingPlan => $composableBuilder(
      column: $table.dataCreatingPlan,
      builder: (column) => ColumnFilters(column));
}

class $$TrainingPlanTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingPlanTableTable> {
  $$TrainingPlanTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idUser => $composableBuilder(
      column: $table.idUser, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dayOfWeek => $composableBuilder(
      column: $table.dayOfWeek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reqReps => $composableBuilder(
      column: $table.reqReps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataCreatingPlan => $composableBuilder(
      column: $table.dataCreatingPlan,
      builder: (column) => ColumnOrderings(column));
}

class $$TrainingPlanTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingPlanTableTable> {
  $$TrainingPlanTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idUser =>
      $composableBuilder(column: $table.idUser, builder: (column) => column);

  GeneratedColumn<String> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => column);

  GeneratedColumn<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle, builder: (column) => column);

  GeneratedColumn<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => column);

  GeneratedColumn<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => column);

  GeneratedColumn<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree, builder: (column) => column);

  GeneratedColumn<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour, builder: (column) => column);

  GeneratedColumn<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive, builder: (column) => column);

  GeneratedColumn<String> get reqReps =>
      $composableBuilder(column: $table.reqReps, builder: (column) => column);

  GeneratedColumn<String> get dataCreatingPlan => $composableBuilder(
      column: $table.dataCreatingPlan, builder: (column) => column);
}

class $$TrainingPlanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingPlanTableTable,
    TrainingPlanTableData,
    $$TrainingPlanTableTableFilterComposer,
    $$TrainingPlanTableTableOrderingComposer,
    $$TrainingPlanTableTableAnnotationComposer,
    $$TrainingPlanTableTableCreateCompanionBuilder,
    $$TrainingPlanTableTableUpdateCompanionBuilder,
    (
      TrainingPlanTableData,
      BaseReferences<_$AppDatabase, $TrainingPlanTableTable,
          TrainingPlanTableData>
    ),
    TrainingPlanTableData,
    PrefetchHooks Function()> {
  $$TrainingPlanTableTableTableManager(
      _$AppDatabase db, $TrainingPlanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingPlanTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingPlanTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingPlanTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idUser = const Value.absent(),
            Value<String> dayOfWeek = const Value.absent(),
            Value<String?> mainMuscle = const Value.absent(),
            Value<String?> secondaryMuscle = const Value.absent(),
            Value<String> exerciseOne = const Value.absent(),
            Value<String?> exerciseTwo = const Value.absent(),
            Value<String?> exerciseThree = const Value.absent(),
            Value<String?> exerciseFour = const Value.absent(),
            Value<String?> exerciseFive = const Value.absent(),
            Value<String> reqReps = const Value.absent(),
            Value<String> dataCreatingPlan = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingPlanTableCompanion(
            idUser: idUser,
            dayOfWeek: dayOfWeek,
            mainMuscle: mainMuscle,
            secondaryMuscle: secondaryMuscle,
            exerciseOne: exerciseOne,
            exerciseTwo: exerciseTwo,
            exerciseThree: exerciseThree,
            exerciseFour: exerciseFour,
            exerciseFive: exerciseFive,
            reqReps: reqReps,
            dataCreatingPlan: dataCreatingPlan,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idUser,
            required String dayOfWeek,
            Value<String?> mainMuscle = const Value.absent(),
            Value<String?> secondaryMuscle = const Value.absent(),
            required String exerciseOne,
            Value<String?> exerciseTwo = const Value.absent(),
            Value<String?> exerciseThree = const Value.absent(),
            Value<String?> exerciseFour = const Value.absent(),
            Value<String?> exerciseFive = const Value.absent(),
            required String reqReps,
            required String dataCreatingPlan,
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingPlanTableCompanion.insert(
            idUser: idUser,
            dayOfWeek: dayOfWeek,
            mainMuscle: mainMuscle,
            secondaryMuscle: secondaryMuscle,
            exerciseOne: exerciseOne,
            exerciseTwo: exerciseTwo,
            exerciseThree: exerciseThree,
            exerciseFour: exerciseFour,
            exerciseFive: exerciseFive,
            reqReps: reqReps,
            dataCreatingPlan: dataCreatingPlan,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingPlanTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingPlanTableTable,
    TrainingPlanTableData,
    $$TrainingPlanTableTableFilterComposer,
    $$TrainingPlanTableTableOrderingComposer,
    $$TrainingPlanTableTableAnnotationComposer,
    $$TrainingPlanTableTableCreateCompanionBuilder,
    $$TrainingPlanTableTableUpdateCompanionBuilder,
    (
      TrainingPlanTableData,
      BaseReferences<_$AppDatabase, $TrainingPlanTableTable,
          TrainingPlanTableData>
    ),
    TrainingPlanTableData,
    PrefetchHooks Function()>;
typedef $$ExerciseTableTableCreateCompanionBuilder = ExerciseTableCompanion
    Function({
  required String id,
  required String name,
  required String urlGif,
  required String mainMuscle,
  required String secondaryMuscle,
  required String instructionsOne,
  required String instructionsTwo,
  required String instructionsThree,
  required String instructionsFour,
  required String equipment,
  Value<int> rowid,
});
typedef $$ExerciseTableTableUpdateCompanionBuilder = ExerciseTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> urlGif,
  Value<String> mainMuscle,
  Value<String> secondaryMuscle,
  Value<String> instructionsOne,
  Value<String> instructionsTwo,
  Value<String> instructionsThree,
  Value<String> instructionsFour,
  Value<String> equipment,
  Value<int> rowid,
});

class $$ExerciseTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urlGif => $composableBuilder(
      column: $table.urlGif, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructionsOne => $composableBuilder(
      column: $table.instructionsOne,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructionsTwo => $composableBuilder(
      column: $table.instructionsTwo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructionsThree => $composableBuilder(
      column: $table.instructionsThree,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructionsFour => $composableBuilder(
      column: $table.instructionsFour,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnFilters(column));
}

class $$ExerciseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urlGif => $composableBuilder(
      column: $table.urlGif, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructionsOne => $composableBuilder(
      column: $table.instructionsOne,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructionsTwo => $composableBuilder(
      column: $table.instructionsTwo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructionsThree => $composableBuilder(
      column: $table.instructionsThree,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructionsFour => $composableBuilder(
      column: $table.instructionsFour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get equipment => $composableBuilder(
      column: $table.equipment, builder: (column) => ColumnOrderings(column));
}

class $$ExerciseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseTableTable> {
  $$ExerciseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get urlGif =>
      $composableBuilder(column: $table.urlGif, builder: (column) => column);

  GeneratedColumn<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => column);

  GeneratedColumn<String> get secondaryMuscle => $composableBuilder(
      column: $table.secondaryMuscle, builder: (column) => column);

  GeneratedColumn<String> get instructionsOne => $composableBuilder(
      column: $table.instructionsOne, builder: (column) => column);

  GeneratedColumn<String> get instructionsTwo => $composableBuilder(
      column: $table.instructionsTwo, builder: (column) => column);

  GeneratedColumn<String> get instructionsThree => $composableBuilder(
      column: $table.instructionsThree, builder: (column) => column);

  GeneratedColumn<String> get instructionsFour => $composableBuilder(
      column: $table.instructionsFour, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);
}

class $$ExerciseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseTableTable,
    ExerciseTableData,
    $$ExerciseTableTableFilterComposer,
    $$ExerciseTableTableOrderingComposer,
    $$ExerciseTableTableAnnotationComposer,
    $$ExerciseTableTableCreateCompanionBuilder,
    $$ExerciseTableTableUpdateCompanionBuilder,
    (
      ExerciseTableData,
      BaseReferences<_$AppDatabase, $ExerciseTableTable, ExerciseTableData>
    ),
    ExerciseTableData,
    PrefetchHooks Function()> {
  $$ExerciseTableTableTableManager(_$AppDatabase db, $ExerciseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> urlGif = const Value.absent(),
            Value<String> mainMuscle = const Value.absent(),
            Value<String> secondaryMuscle = const Value.absent(),
            Value<String> instructionsOne = const Value.absent(),
            Value<String> instructionsTwo = const Value.absent(),
            Value<String> instructionsThree = const Value.absent(),
            Value<String> instructionsFour = const Value.absent(),
            Value<String> equipment = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseTableCompanion(
            id: id,
            name: name,
            urlGif: urlGif,
            mainMuscle: mainMuscle,
            secondaryMuscle: secondaryMuscle,
            instructionsOne: instructionsOne,
            instructionsTwo: instructionsTwo,
            instructionsThree: instructionsThree,
            instructionsFour: instructionsFour,
            equipment: equipment,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String urlGif,
            required String mainMuscle,
            required String secondaryMuscle,
            required String instructionsOne,
            required String instructionsTwo,
            required String instructionsThree,
            required String instructionsFour,
            required String equipment,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseTableCompanion.insert(
            id: id,
            name: name,
            urlGif: urlGif,
            mainMuscle: mainMuscle,
            secondaryMuscle: secondaryMuscle,
            instructionsOne: instructionsOne,
            instructionsTwo: instructionsTwo,
            instructionsThree: instructionsThree,
            instructionsFour: instructionsFour,
            equipment: equipment,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExerciseTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExerciseTableTable,
    ExerciseTableData,
    $$ExerciseTableTableFilterComposer,
    $$ExerciseTableTableOrderingComposer,
    $$ExerciseTableTableAnnotationComposer,
    $$ExerciseTableTableCreateCompanionBuilder,
    $$ExerciseTableTableUpdateCompanionBuilder,
    (
      ExerciseTableData,
      BaseReferences<_$AppDatabase, $ExerciseTableTable, ExerciseTableData>
    ),
    ExerciseTableData,
    PrefetchHooks Function()>;
typedef $$TrainingTableTableCreateCompanionBuilder = TrainingTableCompanion
    Function({
  required String idUser,
  required String dayOfTraining,
  Value<String?> mainMuscle,
  required String exerciseOne,
  required int countRepsExOne,
  required String maxWeightExOne,
  Value<String?> exerciseTwo,
  Value<int?> countRepsExTwo,
  Value<String?> maxWeightExTwo,
  Value<String?> exerciseThree,
  Value<int?> countRepsExThree,
  Value<String?> maxWeightExThree,
  Value<String?> exerciseFour,
  Value<int?> countRepsExFour,
  Value<String?> maxWeightExFour,
  Value<String?> exerciseFive,
  Value<int?> countRepsExFive,
  Value<String?> maxWeightExFive,
  required int percentOfTrainDone,
  Value<int> rowid,
});
typedef $$TrainingTableTableUpdateCompanionBuilder = TrainingTableCompanion
    Function({
  Value<String> idUser,
  Value<String> dayOfTraining,
  Value<String?> mainMuscle,
  Value<String> exerciseOne,
  Value<int> countRepsExOne,
  Value<String> maxWeightExOne,
  Value<String?> exerciseTwo,
  Value<int?> countRepsExTwo,
  Value<String?> maxWeightExTwo,
  Value<String?> exerciseThree,
  Value<int?> countRepsExThree,
  Value<String?> maxWeightExThree,
  Value<String?> exerciseFour,
  Value<int?> countRepsExFour,
  Value<String?> maxWeightExFour,
  Value<String?> exerciseFive,
  Value<int?> countRepsExFive,
  Value<String?> maxWeightExFive,
  Value<int> percentOfTrainDone,
  Value<int> rowid,
});

class $$TrainingTableTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingTableTable> {
  $$TrainingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idUser => $composableBuilder(
      column: $table.idUser, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dayOfTraining => $composableBuilder(
      column: $table.dayOfTraining, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countRepsExOne => $composableBuilder(
      column: $table.countRepsExOne,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maxWeightExOne => $composableBuilder(
      column: $table.maxWeightExOne,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countRepsExTwo => $composableBuilder(
      column: $table.countRepsExTwo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maxWeightExTwo => $composableBuilder(
      column: $table.maxWeightExTwo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countRepsExThree => $composableBuilder(
      column: $table.countRepsExThree,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maxWeightExThree => $composableBuilder(
      column: $table.maxWeightExThree,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countRepsExFour => $composableBuilder(
      column: $table.countRepsExFour,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maxWeightExFour => $composableBuilder(
      column: $table.maxWeightExFour,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get countRepsExFive => $composableBuilder(
      column: $table.countRepsExFive,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maxWeightExFive => $composableBuilder(
      column: $table.maxWeightExFive,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get percentOfTrainDone => $composableBuilder(
      column: $table.percentOfTrainDone,
      builder: (column) => ColumnFilters(column));
}

class $$TrainingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingTableTable> {
  $$TrainingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idUser => $composableBuilder(
      column: $table.idUser, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dayOfTraining => $composableBuilder(
      column: $table.dayOfTraining,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countRepsExOne => $composableBuilder(
      column: $table.countRepsExOne,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maxWeightExOne => $composableBuilder(
      column: $table.maxWeightExOne,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countRepsExTwo => $composableBuilder(
      column: $table.countRepsExTwo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maxWeightExTwo => $composableBuilder(
      column: $table.maxWeightExTwo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countRepsExThree => $composableBuilder(
      column: $table.countRepsExThree,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maxWeightExThree => $composableBuilder(
      column: $table.maxWeightExThree,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countRepsExFour => $composableBuilder(
      column: $table.countRepsExFour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maxWeightExFour => $composableBuilder(
      column: $table.maxWeightExFour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get countRepsExFive => $composableBuilder(
      column: $table.countRepsExFive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maxWeightExFive => $composableBuilder(
      column: $table.maxWeightExFive,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get percentOfTrainDone => $composableBuilder(
      column: $table.percentOfTrainDone,
      builder: (column) => ColumnOrderings(column));
}

class $$TrainingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingTableTable> {
  $$TrainingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idUser =>
      $composableBuilder(column: $table.idUser, builder: (column) => column);

  GeneratedColumn<String> get dayOfTraining => $composableBuilder(
      column: $table.dayOfTraining, builder: (column) => column);

  GeneratedColumn<String> get mainMuscle => $composableBuilder(
      column: $table.mainMuscle, builder: (column) => column);

  GeneratedColumn<String> get exerciseOne => $composableBuilder(
      column: $table.exerciseOne, builder: (column) => column);

  GeneratedColumn<int> get countRepsExOne => $composableBuilder(
      column: $table.countRepsExOne, builder: (column) => column);

  GeneratedColumn<String> get maxWeightExOne => $composableBuilder(
      column: $table.maxWeightExOne, builder: (column) => column);

  GeneratedColumn<String> get exerciseTwo => $composableBuilder(
      column: $table.exerciseTwo, builder: (column) => column);

  GeneratedColumn<int> get countRepsExTwo => $composableBuilder(
      column: $table.countRepsExTwo, builder: (column) => column);

  GeneratedColumn<String> get maxWeightExTwo => $composableBuilder(
      column: $table.maxWeightExTwo, builder: (column) => column);

  GeneratedColumn<String> get exerciseThree => $composableBuilder(
      column: $table.exerciseThree, builder: (column) => column);

  GeneratedColumn<int> get countRepsExThree => $composableBuilder(
      column: $table.countRepsExThree, builder: (column) => column);

  GeneratedColumn<String> get maxWeightExThree => $composableBuilder(
      column: $table.maxWeightExThree, builder: (column) => column);

  GeneratedColumn<String> get exerciseFour => $composableBuilder(
      column: $table.exerciseFour, builder: (column) => column);

  GeneratedColumn<int> get countRepsExFour => $composableBuilder(
      column: $table.countRepsExFour, builder: (column) => column);

  GeneratedColumn<String> get maxWeightExFour => $composableBuilder(
      column: $table.maxWeightExFour, builder: (column) => column);

  GeneratedColumn<String> get exerciseFive => $composableBuilder(
      column: $table.exerciseFive, builder: (column) => column);

  GeneratedColumn<int> get countRepsExFive => $composableBuilder(
      column: $table.countRepsExFive, builder: (column) => column);

  GeneratedColumn<String> get maxWeightExFive => $composableBuilder(
      column: $table.maxWeightExFive, builder: (column) => column);

  GeneratedColumn<int> get percentOfTrainDone => $composableBuilder(
      column: $table.percentOfTrainDone, builder: (column) => column);
}

class $$TrainingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingTableTable,
    TrainingTableData,
    $$TrainingTableTableFilterComposer,
    $$TrainingTableTableOrderingComposer,
    $$TrainingTableTableAnnotationComposer,
    $$TrainingTableTableCreateCompanionBuilder,
    $$TrainingTableTableUpdateCompanionBuilder,
    (
      TrainingTableData,
      BaseReferences<_$AppDatabase, $TrainingTableTable, TrainingTableData>
    ),
    TrainingTableData,
    PrefetchHooks Function()> {
  $$TrainingTableTableTableManager(_$AppDatabase db, $TrainingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> idUser = const Value.absent(),
            Value<String> dayOfTraining = const Value.absent(),
            Value<String?> mainMuscle = const Value.absent(),
            Value<String> exerciseOne = const Value.absent(),
            Value<int> countRepsExOne = const Value.absent(),
            Value<String> maxWeightExOne = const Value.absent(),
            Value<String?> exerciseTwo = const Value.absent(),
            Value<int?> countRepsExTwo = const Value.absent(),
            Value<String?> maxWeightExTwo = const Value.absent(),
            Value<String?> exerciseThree = const Value.absent(),
            Value<int?> countRepsExThree = const Value.absent(),
            Value<String?> maxWeightExThree = const Value.absent(),
            Value<String?> exerciseFour = const Value.absent(),
            Value<int?> countRepsExFour = const Value.absent(),
            Value<String?> maxWeightExFour = const Value.absent(),
            Value<String?> exerciseFive = const Value.absent(),
            Value<int?> countRepsExFive = const Value.absent(),
            Value<String?> maxWeightExFive = const Value.absent(),
            Value<int> percentOfTrainDone = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTableCompanion(
            idUser: idUser,
            dayOfTraining: dayOfTraining,
            mainMuscle: mainMuscle,
            exerciseOne: exerciseOne,
            countRepsExOne: countRepsExOne,
            maxWeightExOne: maxWeightExOne,
            exerciseTwo: exerciseTwo,
            countRepsExTwo: countRepsExTwo,
            maxWeightExTwo: maxWeightExTwo,
            exerciseThree: exerciseThree,
            countRepsExThree: countRepsExThree,
            maxWeightExThree: maxWeightExThree,
            exerciseFour: exerciseFour,
            countRepsExFour: countRepsExFour,
            maxWeightExFour: maxWeightExFour,
            exerciseFive: exerciseFive,
            countRepsExFive: countRepsExFive,
            maxWeightExFive: maxWeightExFive,
            percentOfTrainDone: percentOfTrainDone,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String idUser,
            required String dayOfTraining,
            Value<String?> mainMuscle = const Value.absent(),
            required String exerciseOne,
            required int countRepsExOne,
            required String maxWeightExOne,
            Value<String?> exerciseTwo = const Value.absent(),
            Value<int?> countRepsExTwo = const Value.absent(),
            Value<String?> maxWeightExTwo = const Value.absent(),
            Value<String?> exerciseThree = const Value.absent(),
            Value<int?> countRepsExThree = const Value.absent(),
            Value<String?> maxWeightExThree = const Value.absent(),
            Value<String?> exerciseFour = const Value.absent(),
            Value<int?> countRepsExFour = const Value.absent(),
            Value<String?> maxWeightExFour = const Value.absent(),
            Value<String?> exerciseFive = const Value.absent(),
            Value<int?> countRepsExFive = const Value.absent(),
            Value<String?> maxWeightExFive = const Value.absent(),
            required int percentOfTrainDone,
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTableCompanion.insert(
            idUser: idUser,
            dayOfTraining: dayOfTraining,
            mainMuscle: mainMuscle,
            exerciseOne: exerciseOne,
            countRepsExOne: countRepsExOne,
            maxWeightExOne: maxWeightExOne,
            exerciseTwo: exerciseTwo,
            countRepsExTwo: countRepsExTwo,
            maxWeightExTwo: maxWeightExTwo,
            exerciseThree: exerciseThree,
            countRepsExThree: countRepsExThree,
            maxWeightExThree: maxWeightExThree,
            exerciseFour: exerciseFour,
            countRepsExFour: countRepsExFour,
            maxWeightExFour: maxWeightExFour,
            exerciseFive: exerciseFive,
            countRepsExFive: countRepsExFive,
            maxWeightExFive: maxWeightExFive,
            percentOfTrainDone: percentOfTrainDone,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingTableTable,
    TrainingTableData,
    $$TrainingTableTableFilterComposer,
    $$TrainingTableTableOrderingComposer,
    $$TrainingTableTableAnnotationComposer,
    $$TrainingTableTableCreateCompanionBuilder,
    $$TrainingTableTableUpdateCompanionBuilder,
    (
      TrainingTableData,
      BaseReferences<_$AppDatabase, $TrainingTableTable, TrainingTableData>
    ),
    TrainingTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserInfoTableTableTableManager get userInfoTable =>
      $$UserInfoTableTableTableManager(_db, _db.userInfoTable);
  $$TrainingPlanTableTableTableManager get trainingPlanTable =>
      $$TrainingPlanTableTableTableManager(_db, _db.trainingPlanTable);
  $$ExerciseTableTableTableManager get exerciseTable =>
      $$ExerciseTableTableTableManager(_db, _db.exerciseTable);
  $$TrainingTableTableTableManager get trainingTable =>
      $$TrainingTableTableTableManager(_db, _db.trainingTable);
}
