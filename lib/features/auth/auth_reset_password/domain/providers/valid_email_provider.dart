import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailResetPasswordProvider = StateProvider<String>((ref) => '');

final isValidEmailResetPasswordProvider = StateProvider<bool>((ref) {
  final email = ref.watch(emailResetPasswordProvider);
  return email.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
});
