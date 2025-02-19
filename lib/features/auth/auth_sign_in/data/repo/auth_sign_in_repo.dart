import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_sign_in/data/repo/auth_sign_in_repo_impl.dart';

class AuthSignInRepo implements AuthSignInRepoImpl {
  final SupabaseClient supabase;
  AuthSignInRepo({
    required this.supabase,
  });

  @override
  Future<SignInState> signIn(
      {required String emailOrName, required String password}) async {
    var isUserTypeMail = await supabase
        .from('users')
        .select()
        .eq('email', emailOrName)
        .catchError(() {
      return SignInState.networkError;
    });
    var isUserTypeName =
        await supabase.from('users').select().eq('name', emailOrName);
    if (isUserTypeMail.isNotEmpty) {
      try {
        await supabase.auth
            .signInWithPassword(password: password, email: emailOrName);
        return SignInState.auth;
      } catch (e) {
        return SignInState.networkError;
      }
    } else if (isUserTypeName.isNotEmpty) {
      try {
        await supabase.auth.signInWithPassword(
            password: password, email: isUserTypeName.first['email']);
        return SignInState.auth;
      } catch (e) {
        return SignInState.networkError;
      }
    } else {
      return SignInState.notAuth;
    }
  }
}
