// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_signOut/data/repo/auth_sign_out_data_repo_impl.dart';

class AuthSignOutDataRepo implements AuthSignOutDataRepoImpl {
  final SupabaseClient supabase;
  AuthSignOutDataRepo({
    required this.supabase,
  });
  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
