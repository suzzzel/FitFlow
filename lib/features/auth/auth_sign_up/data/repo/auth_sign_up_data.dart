import 'package:fitflow/features/auth/auth_sign_up/domain/models/sign_up_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_sign_up/data/repo/auth_sign_up_data_impl.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

class AuthSignUpData implements AuthSignUpDataImpl {
  final SupabaseClient supabase;
  AuthSignUpData({
    required this.supabase,
  });

  @override
  Future<SignUpState> signUp(
      {required String email,
      required String password,
      required AppUser user}) async {
    try {
      final AuthResponse res =
          await supabase.auth.signUp(password: password, email: email);
      final User? userSupabase = res.user;
      if (userSupabase!.aud == 'authenticated') {
        try {
          final Map<String, dynamic> userToSupabase = user.toMap();
          userToSupabase.remove('id');
          await supabase.from('app_users').insert(userToSupabase);
          await Future.delayed(const Duration(seconds: 1));
          return SignUpState.success;
        } catch (e) {
          final error = e as PostgrestException;
          if (error.code == '23505') {
            return SignUpState.userAlreadyExist;
          }
          return SignUpState.networkError;
        }
      } else {
        return SignUpState.networkError;
      }
    } on AuthException catch (e) {
      if (e.statusCode == '422') {
        return SignUpState.userAlreadyExist;
      } else {
        return SignUpState.networkError;
      }
    }
  }
}
