import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitflow/features/auth/auth_sign_out/data/repo/auth_sign_out_data_repo_impl.dart';

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
