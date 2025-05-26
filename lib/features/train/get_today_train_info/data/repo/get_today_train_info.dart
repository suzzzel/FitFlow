// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_today_train_info/data/repo/get_today_train_info_impl.dart';

class GetTodayTrainInfoData implements GetTodayTrainInfoImpl {
  final AppDatabase database;
  final SupabaseClient supabase;
  GetTodayTrainInfoData({
    required this.database,
    required this.supabase,
  });

  @override
  Future<TrainingDayClass> getTodayTrainInfo() async {
    final DateTime today = DateTime.now();
    final String formatDate = DateFormat('yyyy-MM-dd').format(today);
    try {
      final offlineTodayTrain = await database.managers.trainingTable
          .filter((train) => train.dayOfTraining(formatDate))
          .getSingleOrNull();
      if (offlineTodayTrain == null) {
        final onlineTodayTrain = await supabase
            .from('trainings_users')
            .select()
            .eq('idUser', supabase.auth.currentUser!.id)
            .eq('dayOfTraining', formatDate)
            .range(1, 1);
        if (onlineTodayTrain.isEmpty) {
          throw Error();
        } else {
          return TrainingDayClass(
              isChillday: false,
              percentOfTrainDone: onlineTodayTrain.first['percentOfTrainDone']);
        }
      } else {
        log(offlineTodayTrain.toString());
        return TrainingDayClass(
            isChillday: false,
            isTrainOver: offlineTodayTrain.isTrainOver,
            percentOfTrainDone: offlineTodayTrain.percentOfTrainDone);
      }
    } catch (e) {
      rethrow;
    }
  }
}
