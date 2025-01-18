import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');
final isValidEmailProvider = StateProvider<bool>((ref) {
  final email = ref.watch(emailProvider);
  return email.isNotEmpty && email.length >= 3;
});

final passwordProvider = StateProvider<String>((ref) => '');
final isValidPasswordProvider = StateProvider<bool>((ref) {
  final password = ref.watch(passwordProvider);
  return password.isNotEmpty && password.length >= 6;
});

final isDataSignInValidProvider = StateProvider<bool>((ref) {
  final isEmailValid = ref.watch(isValidEmailProvider);
  final isPasswordValid = ref.watch(isValidPasswordProvider);
  return isEmailValid && isPasswordValid;
});

final firstImputProvider = StateProvider<bool>((ref) => true);
