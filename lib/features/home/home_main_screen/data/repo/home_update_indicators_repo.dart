import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/home/home_main_screen/data/repo/home_update_indicators_impl.dart';

class HomeUpdateIndicatorsRepoData implements HomeUpdateIndicatorsImpl {
  HomeUpdateIndicatorsRepoData({
    required this.database,
    required this.supabase,
  });

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<bool> updateAge(int newAge) async {
    try {
      await supabase.from('app_users').update({'age': newAge}).eq(
          'email', supabase.auth.currentUser!.email!);
      await database.managers.userInfoTable
          .update((o) => o(age: Value(newAge)));
      await supabase.auth.refreshSession();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateHeight(int newHeight) {
    // TODO: implement updateHeight
    throw UnimplementedError();
  }

  @override
  Future<bool> updateWeight(int newWeight) {
    // TODO: implement updateWeight
    throw UnimplementedError();
  }
}
