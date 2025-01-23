import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailOrNameProvider = StateProvider<String>((ref) => '');
final isValidEmailOrNameProvider = StateProvider<bool>((ref) {
  final email = ref.watch(emailOrNameProvider);
  return email.isNotEmpty && email.length >= 3;
});

final passwordProvider = StateProvider<String>((ref) => '');
final isValidPasswordProvider = StateProvider<bool>((ref) {
  final password = ref.watch(passwordProvider);
  return password.isNotEmpty && password.length >= 6;
});

final isDataSignInValidProvider = StateProvider<bool>((ref) {
  final isEmailOrNameValid = ref.watch(isValidEmailOrNameProvider);
  final isPasswordValid = ref.watch(isValidPasswordProvider);
  return isEmailOrNameValid && isPasswordValid;
});

final firstImputProvider = StateProvider<bool>((ref) => true);
