import 'package:flutter_riverpod/flutter_riverpod.dart';

final newPasswordResetPasswordProvider = StateProvider<String>((ref) => '');

final isValidNewPasswordResetPasswordProvider = StateProvider<bool>((ref) {
  final password = ref.watch(newPasswordResetPasswordProvider);
  return password.isNotEmpty && password.length >= 6;
});

final passwordRepeatResetPasswordProvider = StateProvider<String>((ref) => '');
final isValidpasswordRepeatResetPasswordProvider = StateProvider<bool>(
  (ref) {
    final password = ref.watch(newPasswordResetPasswordProvider);
    final passwordRepeat = ref.watch(passwordRepeatResetPasswordProvider);
    return password == passwordRepeat;
  },
);
