// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/profile/data/repo/home_buttons/home_buttons_data_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeButtonsRepo implements HomeButtonsDataImpl {
  final AppDatabase database;
  final SupabaseClient supabase;
  HomeButtonsRepo({
    required this.database,
    required this.supabase,
  });
  @override
  Future<bool> deletePlan() async {
    final user = supabase.auth.currentUser!;
    try {
      await Future.delayed(Duration(seconds: 3));
      await supabase.from('training_plan_users').delete().eq('idUser', user.id);
      await database.managers.trainingPlanTable
          .filter((f) => f.idUser(user.id))
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
