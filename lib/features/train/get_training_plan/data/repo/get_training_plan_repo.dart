import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_training_plan/data/repo/get_training_plan_impl.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:path_provider/path_provider.dart';
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
          final appDir = await getApplicationDocumentsDirectory();
          final exFolderPath = '${appDir.path}/exGifs';
          await Directory(exFolderPath).create(recursive: true);
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
          final tempDay = TempTrainModel(
            idUser: 'asd',
            dayOfTraining: DateTime.now(),
            tempExercise: 0,
            exerciseOne: x['exerciseOne'],
            exerciseTwo: x['exerciseTwo'],
            exerciseThree: x['exerciseThree'],
            exerciseFour: x['exerciseFour'],
            exerciseFive: x['exerciseFive'],
          );
          final listOfEx = tempDay.getExercise();
          for (var exercise in listOfEx) {
            String tempExIdToGif = exercise.padLeft(4, '0');
            final bool exGifInLocaleMemory =
                await File('$exFolderPath/$tempExIdToGif.gif').exists();
            if (exGifInLocaleMemory) {
              log('find in locale');
            } else {
              log('go to online');
              try {
                final Uint8List gifFromOnline = await supabase.storage
                    .from('exercises.gifs')
                    .download('assets/$tempExIdToGif.gif');
                final exGif = File('$exFolderPath/$tempExIdToGif.gif');
                exGif.writeAsBytesSync(gifFromOnline);
              } catch (e) {
                continue;
                // подумать над заглушкой
              }
            }
          }
        }
        return trainingPlan;
      }
    } catch (e) {
      rethrow;
    }
  }
}
