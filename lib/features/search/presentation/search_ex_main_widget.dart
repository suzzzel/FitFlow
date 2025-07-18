import 'dart:math';

import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/domain/models/filters_list.dart';
import 'package:fitflow/features/search/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/domain/providers/filter_providers_domain.dart';
import 'package:fitflow/features/search/domain/providers/next_page_search_provider.dart';
import 'package:fitflow/features/search/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/search/presentation/components/search_list_of_exercise/search_list_of_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchExMainWidget extends ConsumerStatefulWidget {
  final String? weekday;
  final bool isPlanEdit;
  final ExerciseModel? exerciseToDelete;
  const SearchExMainWidget(
      {super.key,
      required this.isPlanEdit,
      required this.weekday,
      required this.exerciseToDelete});

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
        if (_bodyPartFilter != null ||
            _equipmentFilter != null ||
            _targetFilter != null) {
          ref.read(searchResultDomainProviderProvider.notifier).searchExercise(
              nameOfExercise: userRequest,
              numberOfPage: 1,
              equipment: _equipmentFilter,
              targetMuscleFilter: _targetFilter,
              bodyPartFilter: _bodyPartFilter,
              usingFilter: true);
        } else {
          ref.read(searchResultDomainProviderProvider.notifier).searchExercise(
              nameOfExercise: userRequest, numberOfPage: 1, usingFilter: false);
        }
      });
    }
  }

  void _resetFilters() {
    ref.read(searchResultDomainProviderProvider.notifier).resetList();
    ref.read(nextPageSearchProvider.notifier).state = true;
    ref.read(currentSearchPageProvider.notifier).state = 0;
    ref.read(bodyPartFilterProvider.notifier).state = null;
    ref.read(targetFilterProvider.notifier).state = null;
    ref.read(equipmentFilterProvider.notifier).state = null;
  }

  void _saveFilters() {
    ref.read(searchResultDomainProviderProvider.notifier).resetList();
    ref.read(nextPageSearchProvider.notifier).state = true;
    ref.read(currentSearchPageProvider.notifier).state = 0;
    ref.read(searchResultDomainProviderProvider.notifier).resetList();
    ref.read(bodyPartFilterProvider.notifier).state = _bodyPartFilter;
    ref.read(targetFilterProvider.notifier).state = _targetFilter;
    ref.read(equipmentFilterProvider.notifier).state = _equipmentFilter;
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
              top: MediaQuery.of(context).size.height * 0.35,
              bottom: widget.isPlanEdit ? 0 : 130),
          child: ListViewSearchExRiverpodState(
            tempUserRequest: controller.text,
            weekday: widget.weekday,
            exerciseToDelete: widget.exerciseToDelete,
            isPlanEdit: widget.isPlanEdit,
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
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                    ], transform: const GradientRotation(pi / 2))),
                child: ElevatedButton(
                    onPressed: () {
                      showFilterList(context);
                    },
                    style: const ButtonStyle(
                        elevation: WidgetStatePropertyAll(0),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent)),
                    child: FittedBox(
                      child: Text(
                        'Фильтры',
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<dynamic> showFilterList(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      showDragHandle: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (context, StateSetter setModalBottomSheetState) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed
                ])),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ListView(
                    primary: true,
                    children: [
                      Center(
                          child: Text('Часть тела',
                              style: GoogleFonts.inter(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700))),
                      Column(
                        children: List.generate(
                            bodyPartList.length,
                            (int index) => ListTile(
                                  title: Text(bodyPartList[index],
                                      style: GoogleFonts.inter(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  leading: Radio(
                                    toggleable: true,
                                    fillColor: WidgetStatePropertyAll(
                                      Theme.of(context).colorScheme.onSecondary,
                                    ),
                                    value: bodyPartList[index],
                                    groupValue: _bodyPartFilter,
                                    onChanged: (value) {
                                      setModalBottomSheetState(() {
                                        _bodyPartFilter = value;
                                        ref
                                            .read(
                                                bodyPartFilterProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                  ),
                                )),
                      ),
                      Center(
                          child: Text(
                        'Целевая мышца',
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )),
                      Column(
                        children: List.generate(
                            targetList.length,
                            (int index) => ListTile(
                                  title: Text(targetList[index],
                                      style: GoogleFonts.inter(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  leading: Radio(
                                    fillColor: WidgetStatePropertyAll(
                                      Theme.of(context).colorScheme.onSecondary,
                                    ),
                                    toggleable: true,
                                    value: targetList[index],
                                    groupValue: _targetFilter,
                                    onChanged: (value) {
                                      setModalBottomSheetState(() {
                                        _targetFilter = value;
                                        ref
                                            .read(targetFilterProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                  ),
                                )),
                      ),
                      Center(
                          child: Text(
                        'Оборудование',
                        style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )),
                      Column(
                        children: List.generate(
                            equipmentList.length,
                            (int index) => ListTile(
                                  title: Text(equipmentList[index],
                                      style: GoogleFonts.inter(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  leading: Radio(
                                    fillColor: WidgetStatePropertyAll(
                                      Theme.of(context).colorScheme.onSecondary,
                                    ),
                                    toggleable: true,
                                    value: equipmentList[index],
                                    groupValue: _equipmentFilter,
                                    onChanged: (value) {
                                      setModalBottomSheetState(() {
                                        _equipmentFilter = value;
                                        ref
                                            .read(equipmentFilterProvider
                                                .notifier)
                                            .state = value;
                                      });
                                    },
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              gradient: LinearGradient(colors: [
                                Theme.of(context).colorScheme.error,
                                Theme.of(context).colorScheme.errorContainer,
                              ], transform: const GradientRotation(pi / 2))),
                          child: ElevatedButton(
                              onPressed: () {
                                _resetFilters();
                                setModalBottomSheetState(() {
                                  _bodyPartFilter = null;
                                  _equipmentFilter = null;
                                  _targetFilter = null;
                                });
                                context.pop();
                              },
                              style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent)),
                              child: Text(
                                'Сбросить',
                                style: GoogleFonts.inter(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              gradient: LinearGradient(colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context).colorScheme.primary,
                              ], transform: const GradientRotation(pi / 2))),
                          child: ElevatedButton(
                              onPressed: () {
                                _saveFilters();
                                context.pop();
                              },
                              style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(0),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent)),
                              child: Text(
                                'Сохранить',
                                style: GoogleFonts.inter(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
