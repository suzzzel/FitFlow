import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitflow/features/auth/auth_reset_password/data/repo/auth_reset_pass_repo_impl.dart';

class AuthResetPassRepo implements AuthResetPassRepoImpl {
  final SupabaseClient supabase;
  AuthResetPassRepo({
    required this.supabase,
  });

  @override
  Future<bool> sendRecoveryCode({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<EnterRecoveryCodeStatus> enterRecoveryCode(
      {required String email, required String recoveryCode}) async {
    try {
      await supabase.auth
          .verifyOTP(type: OtpType.recovery, email: email, token: recoveryCode);
      return EnterRecoveryCodeStatus.success;
    } on AuthException catch (error) {
      if (error.statusCode == null) {
        return EnterRecoveryCodeStatus.networkError;
      } else {
        return EnterRecoveryCodeStatus.failure;
      }
    }
  }

  @override
  Future<UpdatePasswordStatus> updatePassword(
      {required String newPassword}) async {
    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
      return UpdatePasswordStatus.sucess;
    } catch (e) {
      if (e.runtimeType == AuthRetryableFetchException) {
        return UpdatePasswordStatus.networkError;
      } else {
        return UpdatePasswordStatus.failure;
      }
    }
  }
}
