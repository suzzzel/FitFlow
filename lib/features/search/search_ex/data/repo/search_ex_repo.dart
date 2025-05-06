import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/search/search_ex/data/repo/search_ex_impl.dart';

class SearchExerciseRepo implements SearchExercisesRepoImpl {
  final AppDatabase database;
  final SupabaseClient supabase;
  SearchExerciseRepo({
    required this.database,
    required this.supabase,
  });
  @override
  Future<List<ExerciseModel>> searchExercisesByUserRequest({
    required String nameOfExercise,
    required int numberOfPage,
    required bool usingFilter,
    String? bodyPartFilter,
    String? targetMuscleFilter,
    String? equipment,
  }) async {
    final rangeLimit = numberOfPage * 10;
    try {
      List<Map<String, dynamic>> findExercises = [];
      final appDirForPreloadGif = await getApplicationDocumentsDirectory();
      final exFolderPath = '${appDirForPreloadGif.path}/exGifs';
      await Directory(exFolderPath).create(recursive: true);
      // Ни один фильтр не выбран юзером
      if (!usingFilter) {
        findExercises = await supabase
            .from('exercises')
            .select()
            .ilike('name', '%$nameOfExercise%')
            .eq('body', '')
            .range(rangeLimit - 10, rangeLimit - 1);
      } else {
        // Все фильтры выбраны юзером
        if (bodyPartFilter != null &&
            targetMuscleFilter != null &&
            equipment != null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('bodyPart', bodyPartFilter)
              .eq('target', targetMuscleFilter)
              .eq('equipment', equipment)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "части тела"
        else if (bodyPartFilter != null &&
            targetMuscleFilter == null &&
            equipment == null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('bodyPart', bodyPartFilter)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "целевой мышце"
        else if (bodyPartFilter == null &&
            targetMuscleFilter != null &&
            equipment == null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('target', targetMuscleFilter)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "оборудование"
        else if (bodyPartFilter == null &&
            targetMuscleFilter == null &&
            equipment != null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('equipment', equipment)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "части тела" и "целевой мышце"
        else if (bodyPartFilter != null &&
            targetMuscleFilter != null &&
            equipment == null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('bodyPart', bodyPartFilter)
              .eq('target', targetMuscleFilter)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "части тела" и "оборудование"
        else if (bodyPartFilter != null &&
            targetMuscleFilter == null &&
            equipment != null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('bodyPart', bodyPartFilter)
              .eq('equipment', equipment)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
        // Выбран фильтр по "целевой мышце" и "оборудование"
        else if (bodyPartFilter == null &&
            targetMuscleFilter != null &&
            equipment != null) {
          findExercises = await supabase
              .from('exercises')
              .select()
              .eq('target', targetMuscleFilter)
              .eq('equipment', equipment)
              .range(rangeLimit - 10, rangeLimit - 1);
        }
      }
      if (findExercises.isEmpty) {
        return [];
      } else {
        final listExercises = findExercises
            .map((exercise) => ExerciseModel.fromJson(exercise))
            .toList();
        for (var x in listExercises) {
          log(x.name);
        }
        for (var exercise in listExercises) {
          String tempExIdToGif = exercise.id.toString().padLeft(4, '0');
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
        return listExercises;
      }
    } catch (e) {
      rethrow;
    }
  }
}
