import 'dart:developer';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/data/repo/training_plan_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrainingPlanRepoData extends TrainingPlanDataImpl {
  TrainingPlanRepoData({required this.database, required this.supabase});

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<void> getTrainingPlan({required String id}) async {
    try {
      final plan = await database.managers.trainingPlanTable.get();
      if (plan.isNotEmpty) {
        for (var x in plan) {
          log(x.toString());
        }
      } else {
        log('locale plan is empty');
      }
      if (plan.isEmpty) {
        final onlinePlan = await supabase
            .from('training_plan_users')
            .select()
            .eq('id_user', id);
        for (var x in onlinePlan) {
          log(x.toString());
          await database.managers.trainingPlanTable.create((train) => train(
              dayOfWeek: x['day_of_week'],
              exerciseOne: x['exercise_one'],
              reqReps: x['req_reps']));
        }
      }
    } catch (e) {
      log('error');
    }
  }
}
