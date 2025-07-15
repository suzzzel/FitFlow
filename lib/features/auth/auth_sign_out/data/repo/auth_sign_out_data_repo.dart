import 'package:fitflow/features/db/app_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitflow/features/auth/auth_sign_out/data/repo/auth_sign_out_data_repo_impl.dart';

class AuthSignOutDataRepo implements AuthSignOutDataRepoImpl {
  final AppDatabase database;
  final SupabaseClient supabase;

  AuthSignOutDataRepo({required this.supabase, required this.database});
  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      await database.managers.userInfoTable.delete();
      await database.managers.trainingPlanTable.delete();
    } catch (e) {
      rethrow;
    }
  }
}
