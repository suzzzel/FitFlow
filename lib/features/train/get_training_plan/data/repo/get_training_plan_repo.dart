import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/get_training_plan/data/repo/get_training_plan_impl.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetTrainingPlanRepoData extends GetTrainingPlanDataImpl {
  GetTrainingPlanRepoData({required this.database, required this.supabase});

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
          log('${DateTime.now().difference(DateTime.parse(trainingPlan.first.dataCreatingPlan)).inDays}');
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
          log('${DateTime.now().difference(DateTime.parse(trainingPlan.first.dataCreatingPlan)).inDays}');
          await database.managers.trainingPlanTable.create((train) => train(
              idUser: x['idUser'],
              dayOfWeek: x['dayOfWeek'],
              mainMuscle: Value(x['mainMuscle']),
              secondaryMuscle: Value(x['secondaryMuscle']),
              exerciseOne: x['exerciseOne'],
              exerciseTwo: Value(x['exerciseTwo']),
              exerciseThree: Value(x['exerciseThree']),
              exerciseFour: Value(x['exerciseFour']),
              exerciseFive: Value(x['exerciseFive']),
              reqReps: x['reqReps'],
              dataCreatingPlan: x['dataCreatingPlan'].toString()));
        }
        return trainingPlan;
      }
    } catch (e) {
      rethrow;
    }
  }
}
