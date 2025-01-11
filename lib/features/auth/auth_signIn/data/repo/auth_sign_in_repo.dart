// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_signIn/data/repo/auth_sign_in_repo_impl.dart';

class AuthSignInRepo implements AuthSignInRepoImpl {
  final SupabaseClient supabase;
  AuthSignInRepo({
    required this.supabase,
  });

  @override
  Future<void> signIn(
      {required String emailOrName, required String password}) async {
    var isUserTypeMail =
        await supabase.from('users').select().eq('email', emailOrName);
    var isUserTypeName =
        await supabase.from('users').select().eq('name', emailOrName);
    if (isUserTypeMail.isNotEmpty) {
      try {
        await supabase.auth
            .signInWithPassword(password: password, email: emailOrName);
      } catch (e) {
        rethrow;
      }
    } else if (isUserTypeName.isNotEmpty) {
      try {
        await supabase.auth.signInWithPassword(
            password: password, email: isUserTypeName.first['email']);
      } catch (e) {
        rethrow;
      }
    } else {
      throw Error();
    }
  }
}
