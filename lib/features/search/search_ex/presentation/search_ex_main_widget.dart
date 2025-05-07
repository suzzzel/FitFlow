import 'dart:developer';
import 'dart:io';

import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/domain/models/filters_list.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/next_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchExMainWidget extends ConsumerStatefulWidget {
  final Directory dir;
  const SearchExMainWidget({super.key, required this.dir});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchExMainWidgetState();
}

class _SearchExMainWidgetState extends ConsumerState<SearchExMainWidget> {
  final controller = TextEditingController();
  String? _bodyPartFilter;
  String? _targetFilter;
  String? _equipmentFilter;

  void _search({required String userRequest}) {
    if (userRequest.isEmpty) {
    } else {
      setState(() {
        ref.read(currentSearchPageProvider.notifier).state = 1;
        ref.read(nextPageSearchProvider.notifier).state = true;
        // ref
        //     .read(searchResultDomainProviderProvider.notifier)
        //     .searchExercise(nameOfExercise: userRequest, numberOfPage: 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 27,
              right: 27,
              top: MediaQuery.of(context).size.height * 0.35),
          child: ListViewSearchExRiverpodState(
            tempUserRequest: controller.text,
            dir: widget.dir,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: 27,
                  right: 27),
              child: CustomTextField(
                controller: controller,
                labelText: 'Название упражнения',
                obscureText: false,
                keyboardType: TextInputType.text,
                isImputRight: true,
                onFieldSubmitted: (value) {
                  _search(userRequest: controller.text);
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      _search(userRequest: controller.text);
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      showDragHandle: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (context, StateSetter setModalBottomSheetState) {
                          return ListView(
                            primary: true,
                            children: [
                              const Center(
                                  child: Text(
                                'Часть тела',
                                style: TextStyle(color: Colors.white),
                              )),
                              Column(
                                children: List.generate(
                                    bodyPartList.length,
                                    (int index) => ListTile(
                                          title: Text(bodyPartList[index]),
                                          leading: Radio(
                                            value: bodyPartList[index],
                                            groupValue: _bodyPartFilter,
                                            onChanged: (value) {
                                              setModalBottomSheetState(() {
                                                _bodyPartFilter = value;
                                                log(_bodyPartFilter ?? 'jopa');
                                              });
                                            },
                                          ),
                                        )),
                              ),
                              const Center(
                                  child: Text(
                                'Целевая мышца',
                                style: TextStyle(color: Colors.white),
                              )),
                              Column(
                                children: List.generate(
                                    targetList.length,
                                    (int index) => ListTile(
                                          title: Text(targetList[index]),
                                          leading: Radio(
                                            value: targetList[index],
                                            groupValue: _targetFilter,
                                            onChanged: (value) {
                                              setModalBottomSheetState(() {
                                                _targetFilter = value;
                                                log(_targetFilter ?? 'jopa');
                                              });
                                            },
                                          ),
                                        )),
                              ),
                              const Center(
                                  child: Text(
                                'Оборудование',
                                style: TextStyle(color: Colors.white),
                              )),
                              Column(
                                children: List.generate(
                                    equipmentList.length,
                                    (int index) => ListTile(
                                          title: Text(equipmentList[index]),
                                          leading: Radio(
                                            value: equipmentList[index],
                                            groupValue: _equipmentFilter,
                                            onChanged: (value) {
                                              setModalBottomSheetState(() {
                                                _equipmentFilter = value;
                                                log(_equipmentFilter ?? 'jopa');
                                              });
                                            },
                                          ),
                                        )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('reset')),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('save'))
                                ],
                              )
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: Text('filters')),
            ),
          ],
        ),
      ],
    );
  }
}

class ListViewSearchExRiverpodState extends ConsumerWidget {
  final Directory dir;
  final String tempUserRequest;

  const ListViewSearchExRiverpodState(
      {super.key, required this.dir, required this.tempUserRequest});

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
          dir: dir,
        ),
      AsyncLoading(value: final items?) => ListOfExercices(
          tempUserRequest: tempUserRequest,
          exercises: items,
          dir: dir,
        ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => ErrorWidget(error),
      _ => const SizedBox.shrink(),
    };
  }
}

class ListOfExercices extends StatelessWidget {
  final List<ExerciseModel> exercises;
  final Directory dir;
  final String tempUserRequest;

  const ListOfExercices(
      {super.key,
      required this.dir,
      required this.exercises,
      required this.tempUserRequest});

  @override
  Widget build(BuildContext context) {
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
                  exGifFile: exGifFile, dir: dir, exercise: exercises[index]);
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

class LoadingNewPageButton extends ConsumerWidget {
  final String tempRequest;
  const LoadingNewPageButton({super.key, required this.tempRequest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvState = ref.watch(searchResultDomainProviderProvider);
    final nextPageProv = ref.watch(nextPageSearchProvider);
    final currenPageProv = ref.watch(currentSearchPageProvider);

    return switch (searchProvState) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Text('Ошибка загрузки: ${error.toString()}'),
      _ when !nextPageProv =>
        const Text('Больше упражнений нет', textAlign: TextAlign.center),
      _ when searchProvState.value!.isNotEmpty && !searchProvState.isLoading =>
        ElevatedButton(
          onPressed: () {
            // ref
            //     .read(searchResultDomainProviderProvider.notifier)
            //     .newDownloadNextPage(
            //       nameOfExercise: tempRequest,
            //       prevPage: currenPageProv,
            //     );
            ref.read(currentSearchPageProvider.notifier).state++;
          },
          child: const Text('Загрузить еще'),
        ),
      _ when searchProvState.isLoading =>
        Center(child: const CircularProgressIndicator()),
      _ => SizedBox(),
    };
  }
}

class ExerciseSearchWidget extends StatelessWidget {
  const ExerciseSearchWidget(
      {super.key,
      required this.exGifFile,
      required this.dir,
      required this.exercise});

  final File exGifFile;
  final Directory dir;
  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExerciseImage(exGifFile: exGifFile),
            Text(
              exercise.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
