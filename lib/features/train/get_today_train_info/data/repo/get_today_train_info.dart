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
          .filter((train) => train.dayOfTraining.equals(formatDate))
          .getSingleOrNull();
      if (offlineTodayTrain == null) {
        final onlineTodayTrain = await supabase
            .from('trainings_users')
            .select()
            .eq('idUser', supabase.auth.currentUser!.id)
            .eq('dayOfTraining', formatDate)
            .range(0, 1);
        if (onlineTodayTrain.isEmpty) {
          throw Error();
        } else {
          return TrainingDayClass(
              isChillday: false,
              idUser: onlineTodayTrain.first['idUser'],
              isTrainOver: onlineTodayTrain.first['isTrainOver'],
              dayOfTraining: onlineTodayTrain.first['dayOfTraining'],
              mainMuscle: onlineTodayTrain.first['mainMuscle'],
              exerciseOne: onlineTodayTrain.first['exerciseOne'],
              countRepsExOne: onlineTodayTrain.first['countRepsExOne'],
              maxWeightExOne: onlineTodayTrain.first['maxWeightExOne'],
              exerciseTwo: onlineTodayTrain.first['exerciseTwo'],
              countRepsExTwo: onlineTodayTrain.first['countRepsExTwo'],
              maxWeightExTwo: onlineTodayTrain.first['maxWeightExTwo'],
              exerciseThree: onlineTodayTrain.first['exerciseThree'],
              countRepsExThree: onlineTodayTrain.first['countRepsExThree'],
              maxWeightExThree: onlineTodayTrain.first['maxWeightExThree'],
              exerciseFour: onlineTodayTrain.first['exerciseFour'],
              countRepsExFour: onlineTodayTrain.first['countRepsExFour'],
              maxWeightExFour: onlineTodayTrain.first['maxWeightExFour'],
              exerciseFive: onlineTodayTrain.first['exerciseFive'],
              countRepsExFive: onlineTodayTrain.first['countRepsExFive'],
              maxWeightExFive: onlineTodayTrain.first['maxWeightExFive'],
              percentOfTrainDone: onlineTodayTrain.first['percentOfTrainDone']);
        }
      } else {
        log(offlineTodayTrain.toString());
        return TrainingDayClass(
            isChillday: false,
            idUser: offlineTodayTrain.idUser,
            isTrainOver: offlineTodayTrain.isTrainOver,
            dayOfTraining: offlineTodayTrain.dayOfTraining,
            mainMuscle: offlineTodayTrain.mainMuscle,
            exerciseOne: offlineTodayTrain.exerciseOne,
            countRepsExOne: offlineTodayTrain.countRepsExOne,
            maxWeightExOne: offlineTodayTrain.maxWeightExOne,
            exerciseTwo: offlineTodayTrain.exerciseTwo,
            countRepsExTwo: offlineTodayTrain.countRepsExTwo,
            maxWeightExTwo: offlineTodayTrain.maxWeightExTwo,
            exerciseThree: offlineTodayTrain.exerciseThree,
            countRepsExThree: offlineTodayTrain.countRepsExThree,
            maxWeightExThree: offlineTodayTrain.maxWeightExThree,
            exerciseFour: offlineTodayTrain.exerciseFour,
            countRepsExFour: offlineTodayTrain.countRepsExFour,
            maxWeightExFour: offlineTodayTrain.maxWeightExFour,
            exerciseFive: offlineTodayTrain.exerciseFive,
            countRepsExFive: offlineTodayTrain.countRepsExFive,
            maxWeightExFive: offlineTodayTrain.maxWeightExFive,
            percentOfTrainDone: offlineTodayTrain.percentOfTrainDone);
      }
    } catch (e) {
      rethrow;
    }
  }
}
