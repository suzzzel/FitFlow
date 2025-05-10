import 'dart:io';

import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/exercise_ui_widget.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/new_page_load_button.dart';
import 'package:fitflow/features/search/search_ex/presentation/search_ex_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfExercices extends ConsumerWidget {
  final List<ExerciseModel> exercises;
  final Directory dir;
  final bool isPlanEdit;
  final String? weekday;

  final String tempUserRequest;

  const ListOfExercices(
      {super.key,
      required this.dir,
      required this.exercises,
      required this.tempUserRequest,
      required this.isPlanEdit,
      required this.weekday});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final exIdGif = exercises[index].id.toString().padLeft(4, '0');
              final exGifFile = File('${dir.path}/exGifs/$exIdGif.gif');
              return ExerciseSearchWidget(
                exGifFile: exGifFile,
                dir: dir,
                weekday: weekday,
                exercise: exercises[index],
                isPlanEdit: isPlanEdit,
              );
            },
            childCount: exercises.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingNewPageButton(
                tempRequest: tempUserRequest,
              )),
        ),
      ],
    );
  }
}

class ListViewSearchExRiverpodState extends ConsumerWidget {
  final Directory dir;
  final bool isPlanEdit;
  final String? weekday;
  final String tempUserRequest;

  const ListViewSearchExRiverpodState(
      {super.key,
      required this.dir,
      required this.tempUserRequest,
      required this.isPlanEdit,
      required this.weekday});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchResultDomainProviderProvider);
    final currentPageProvider = ref.watch(currentSearchPageProvider);
    return switch (searchProvider) {
      AsyncData(value: final items)
          when items.isEmpty && currentPageProvider == 1 =>
        const Center(
          child: Text(
            'Ничего не найдено\nПопробуйте изменить запрос',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      AsyncData(value: final items) => ListOfExercices(
          tempUserRequest: tempUserRequest,
          exercises: items,
          weekday: weekday,
          dir: dir,
          isPlanEdit: isPlanEdit,
        ),
      AsyncLoading(value: final items?) => ListOfExercices(
          tempUserRequest: tempUserRequest,
          exercises: items,
          weekday: weekday,
          dir: dir,
          isPlanEdit: isPlanEdit,
        ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => ErrorWidget(error),
      _ => const SizedBox.shrink(),
    };
  }
}
