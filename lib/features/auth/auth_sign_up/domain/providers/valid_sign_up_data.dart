import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailSignUpProvider = StateProvider.autoDispose<String>((ref) => '');
final isValidEmailSignUpProvider = StateProvider.autoDispose<bool>((ref) {
  final email = ref.watch(emailSignUpProvider);
  return email.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
});

final passwordSignUpProvider = StateProvider.autoDispose<String>((ref) => '');
final isValidpasswordSignUpProvider = StateProvider.autoDispose<bool>(
  (ref) {
    final password = ref.watch(passwordSignUpProvider);
    return password.isNotEmpty && password.length >= 6;
  },
);

final passwordRepeatSignUpProvider =
    StateProvider.autoDispose<String>((ref) => '');
final isValidpasswordRepeatSignUpProvider = StateProvider.autoDispose<bool>(
  (ref) {
    final password = ref.watch(passwordSignUpProvider);
    final passwordRepeat = ref.watch(passwordRepeatSignUpProvider);
    return password == passwordRepeat;
  },
);

final nameSignUpProvider = StateProvider.autoDispose<String>((ref) => '');

final isValidnameSignUpProvider = StateProvider.autoDispose<bool>((ref) {
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
