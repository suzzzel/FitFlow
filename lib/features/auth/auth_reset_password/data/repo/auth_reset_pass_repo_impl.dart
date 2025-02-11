import 'package:fitflow/features/auth/auth_reset_password/domain/models/reset_pass_enums.dart';

abstract class AuthResetPassRepoImpl {
  Future<bool> sendRecoveryCode({required String email});
  Future<EnterRecoveryCodeStatus> enterRecoveryCode({
    required String email,
    required String recoveryCode,
  });
  Future<UpdatePasswordStatus> updatePassword({required String newPassword});
}
