// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_reset_password/data/repo/auth_reset_pass_repo_impl.dart';

class AuthResetPassRepo implements AuthResetPassRepoImpl {
  final SupabaseClient supabase;
  AuthResetPassRepo({
    required this.supabase,
  });

  @override
  Future<bool> resetPassword({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updatePassword(
      {required String email,
      required String recoveryCode,
      required String newPassword}) async {
    try {
      await supabase.auth
          .verifyOTP(type: OtpType.recovery, email: email, token: recoveryCode);
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
