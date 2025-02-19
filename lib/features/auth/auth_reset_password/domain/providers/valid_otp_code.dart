import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpResetPasswordProvider = StateProvider<String>((ref) => '');

final isValidOTPResetPasswordProvider = StateProvider<bool>((ref) {
  final otp = ref.watch(otpResetPasswordProvider);
  return otp.isNotEmpty && otp.length == 6;
});
