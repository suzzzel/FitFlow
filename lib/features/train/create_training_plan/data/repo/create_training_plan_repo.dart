// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:fitflow/features/train/create_training_plan/domain/models/ready_training_plan_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/create_training_plan/data/repo/create_training_plan_repo_impl.dart';

class CreateTrainingPlanRepo implements CreateTrainingPlanRepoImpl {
  CreateTrainingPlanRepo({
    required this.database,
    required this.supabase,
  });

  final AppDatabase database;
  final SupabaseClient supabase;

  @override
  Future<Map<int, List<ReadyTrainingPlanModel>>> getReadyTrainingPlans() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final exFolderPath = '${appDir.path}/exGifs';
      await Directory(exFolderPath).create(recursive: true);
      final tempUser = await database.managers.userInfoTable.getSingle();
      final Map<int, List<ReadyTrainingPlanModel>> returnMap = {};
      List<Map<String, dynamic>> trainingPlansFromSupabase = await supabase
          .from('ready_training_plans')
          .select()
          .eq('level', tempUser.level)
          .eq('goal', tempUser.goal);
      if (trainingPlansFromSupabase.isEmpty) {
        trainingPlansFromSupabase =
            await supabase.from('ready_training_plans').select();
      }
      for (var x in trainingPlansFromSupabase) {
        final tempIdTrain = x['idTrain'];
        final isThisTrainPlanExistInMap = returnMap.containsKey(tempIdTrain);
        if (isThisTrainPlanExistInMap) {
          returnMap[tempIdTrain]!.add(ReadyTrainingPlanModel(
              idTrain: tempIdTrain,
              name: x['name'],
              level: x['level'],
              goal: x['goal'],
              weekday: x['weekday'],
              exOne: x['exOne'],
              exTwo: x['exTwo'],
              exThree: x['exThree'],
              exFour: x['exFour'],
              exFive: x['exFive'],
              reqReps: x['reqReps']));
        } else {
          final List<ReadyTrainingPlanModel> newList = [
            ReadyTrainingPlanModel(
                idTrain: tempIdTrain,
                name: x['name'],
                level: x['level'],
                goal: x['goal'],
                weekday: x['weekday'],
                exOne: x['exOne'],
                exTwo: x['exTwo'],
                exThree: x['exThree'],
                exFour: x['exFour'],
                exFive: x['exFive'],
                reqReps: x['reqReps'])
          ];
          returnMap.addAll({tempIdTrain: newList});
        }
      }

      // Проходим итерацией по тренировочным планам
      for (var trainPlan in returnMap.values) {
        // Проходим итерацией по каждому дню в трен. плане
        for (var trainDay in trainPlan) {
          // Проходим итерацией по каждому упражнению в трен. дне
          for (int exercise = 0; exercise != 5; exercise++) {
            String tempEx = '';
            String tempExId = '';
            // НУЖНО ПРИВЕСТИ tempExId К ФОРМАТУ "0001"
            switch (exercise) {
              case 0:
                tempEx = 'exOne';
                tempExId = trainDay.exOne;
              case 1:
                tempEx = 'exTwo';
                tempExId = trainDay.exTwo ?? '';
              case 2:
                tempEx = 'exThree';
                tempExId = trainDay.exThree ?? '';
              case 3:
                tempEx = 'exFour';
                tempExId = trainDay.exFour ?? '';
              case 4:
                tempEx = 'exFive';
                tempExId = trainDay.exFive ?? '';
            }
            if (tempEx == '') {
              break;
            } else {
              try {
                final bool exGifInLocaleMemory =
                    await File('$exFolderPath/$tempExId.gif').exists();
                if (exGifInLocaleMemory) {
                  final exGif = File('$exFolderPath/$tempExId.gif');
                  trainDay = trainDay.copyWith(exGif: exGif);
                  log('find in locale');
                } else {
                  log('go to online');
                  final Uint8List gifFromOnline = await supabase.storage
                      .from('exercises.gifs')
                      .download('assets/$tempExId.gif');
                  final exGif = File('$exFolderPath/$tempExId.gif');
                  exGif.writeAsBytesSync(gifFromOnline);
                  trainDay = trainDay.copyWith(exGif: exGif);
                }
              } catch (e) {}
              log(trainDay.exGif?.path.toString() ?? 'asd');
            }
          }
        }
      }

      return returnMap;
    } catch (e) {
      rethrow;
    }
  }
}
