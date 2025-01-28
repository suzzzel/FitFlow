// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final int? id;
  // ignore: non_constant_identifier_names
  final String? created_at;
  final String? name;
  final int? age;
  final String? email;
  final String? goal;
  final bool? sex;
  final int? height;
  final int? weight;
  final String? level;
  AppUser({
    this.id,
    // ignore: non_constant_identifier_names
    this.created_at,
    this.name,
    this.age,
    this.email,
    this.goal,
    this.sex,
    this.height,
    this.weight,
    this.level,
  });

  @override
  String toString() {
    return 'AppUser(uid: $id, created_at: $created_at, name: $name, age: $age, email: $email, goal: $goal, sex: $sex, height: $height, weight: $weight, level: $level)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'name': name,
      'age': age,
      'email': email,
      'goal': goal,
      'sex': sex,
      'height': height,
      'weight': weight,
      'level': level,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at']).toString(),
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      goal: map['goal'] != null ? map['goal'] as String : null,
      sex: map['sex'] != null ? map['sex'] as bool : null,
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      level: map['level'] != null ? map['level'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  AppUser copyWith({
    int? id,
    String? created_at,
    String? name,
    int? age,
    String? email,
    String? goal,
    bool? sex,
    int? height,
    int? weight,
    String? level,
  }) {
    return AppUser(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      goal: goal ?? this.goal,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      level: level ?? this.level,
    );
  }
}
