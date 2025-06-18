import 'dart:io';

import 'package:fitflow/features/general_comonents/doc_provider.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/exercise_ui_widget.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/search_list_of_exercise/components/load_new_page/new_page_load_widget.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/search_list_of_exercise/components/nothing_to_show_text.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfExercices extends ConsumerWidget {
  final List<ExerciseModel> exercises;
  final Directory dir;
  final bool isPlanEdit;
  final String? weekday;
  final ExerciseModel? exerciseToDelete;

  final String tempUserRequest;

  const ListOfExercices(
      {super.key,
      required this.dir,
      required this.exercises,
      required this.tempUserRequest,
      required this.isPlanEdit,
      required this.weekday,
      required this.exerciseToDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final exIdGif = exercises[index].id.toString().padLeft(4, '0');
              final exGifFile = File('${dir.path}/exGifs/$exIdGif.gif');
              return ExerciseSearchWidget(
                exGifFile: exGifFile,
                dir: dir,
                weekday: weekday,
                exercise: exercises[index],
                exerciseToDelete: exerciseToDelete,
                isPlanEdit: isPlanEdit,
              );
            },
            childCount: exercises.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingNewPageWidget(
                tempRequest: tempUserRequest,
              )),
        ),
      ],
    );
  }
}

class ListViewSearchExRiverpodState extends ConsumerWidget {
  final bool isPlanEdit;
  final String? weekday;
  final String tempUserRequest;
  final ExerciseModel? exerciseToDelete;

  const ListViewSearchExRiverpodState(
      {super.key,
      required this.tempUserRequest,
      required this.isPlanEdit,
      required this.weekday,
      required this.exerciseToDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchResultDomainProviderProvider);
    final currentPageProvider = ref.watch(currentSearchPageProvider);
    AsyncValue<Directory> dir = ref.watch(documentsDirectoryProvider);
    return dir.when(
        data: (directory) {
          return switch (searchProvider) {
            AsyncData(value: final items)
                when items.isEmpty && currentPageProvider == 1 =>
              const NothingToShowWidget(),
            AsyncData(value: final items) => ListOfExercices(
                tempUserRequest: tempUserRequest,
                exercises: items,
                weekday: weekday,
                dir: dir.value!,
                exerciseToDelete: exerciseToDelete,
                isPlanEdit: isPlanEdit,
              ),
            AsyncLoading(value: final items?) => ListOfExercices(
                tempUserRequest: tempUserRequest,
                exercises: items,
                weekday: weekday,
                exerciseToDelete: exerciseToDelete,
                dir: dir.value!,
                isPlanEdit: isPlanEdit,
              ),
            AsyncLoading() => const Center(child: CircularProgressIndicator()),
            AsyncError() => const SomethingGoesWrongWidget(),
            _ => const SizedBox.shrink(),
          };
        },
        error: (err, stack) => const SomethingGoesWrongWidget(),
        loading: () => const CircularProgressIndicator());
  }
}
