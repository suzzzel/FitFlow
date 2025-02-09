import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailSignUpProvider = StateProvider<String>((ref) => '');
final isValidEmailSignUpProvider = StateProvider<bool>((ref) {
  final email = ref.watch(emailSignUpProvider);
  return email.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
});

final passwordSignUpProvider = StateProvider<String>((ref) => '');
final isValidpasswordSignUpProvider = StateProvider<bool>(
  (ref) {
    final password = ref.watch(passwordSignUpProvider);
    return password.isNotEmpty && password.length >= 6;
  },
);

final passwordRepeatSignUpProvider = StateProvider<String>((ref) => '');
final isValidpasswordRepeatSignUpProvider = StateProvider<bool>(
  (ref) {
    final password = ref.watch(passwordSignUpProvider);
    final passwordRepeat = ref.watch(passwordRepeatSignUpProvider);
    return password == passwordRepeat;
  },
);

final nameSignUpProvider = StateProvider<String>((ref) => '');

final isValidnameSignUpProvider = StateProvider<bool>((ref) {
  final name = ref.watch(nameSignUpProvider);
  log('name: $name');
  return name.isNotEmpty && name.length >= 3;
});

final isDataSignUpValidProvider = StateProvider<bool>((ref) {
  final isValidName = ref.watch(isValidnameSignUpProvider);
  final isValidEmail = ref.watch(isValidEmailSignUpProvider);
  final isValidPassword = ref.watch(isValidpasswordSignUpProvider);
  final isValidPasswordRepeat = ref.watch(isValidpasswordRepeatSignUpProvider);
  return isValidName &&
      isValidEmail &&
      isValidPassword &&
      isValidPasswordRepeat;
});
