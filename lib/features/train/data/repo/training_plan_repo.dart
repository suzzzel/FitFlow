import 'dart:developer';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/data/repo/training_plan_impl.dart';
import 'package:fitflow/features/train/domain/models/training_plan_class.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrainingPlanRepoData extends TrainingPlanDataImpl {
  TrainingPlanRepoData({required this.database, required this.supabase});

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<List<TrainingPlanClass>> getTrainingPlan({required String id}) async {
    try {
      // await database.managers.trainingPlanTable.delete();
      final offlinePlan = await database.managers.trainingPlanTable.get();
      if (offlinePlan.isNotEmpty) {
        final List<TrainingPlanClass> trainingPlan = [];
        for (var x in offlinePlan) {
          log('offline');
          final trainingDay = TrainingPlanClass.fromMap(x.toJson());
          trainingPlan.add(trainingDay);
          log(trainingDay.toString());
        }
        return trainingPlan;
      } else {
        final onlinePlan = await supabase
            .from('training_plan_users')
            .select()
            .eq('idUser', id);
        final List<TrainingPlanClass> trainingPlan = [];
        for (var x in onlinePlan) {
          log('online');
          final trainingDay = TrainingPlanClass.fromMap(x);
          log(trainingDay.toString());
          trainingPlan.add(trainingDay);
          await database.managers.trainingPlanTable.create((train) => train(
              idUser: x['idUser'],
              dayOfWeek: x['dayOfWeek'],
              exerciseOne: x['exerciseOne'],
              reqReps: x['reqReps']));
        }
        return trainingPlan;
      }
    } catch (e) {
      rethrow;
    }
  }
}
