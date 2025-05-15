import 'dart:developer';
import 'dart:io';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:fitflow/features/search/search_ex/domain/models/filters_list.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/filter_providers_domain.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/next_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/search_list_of_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchExMainWidget extends ConsumerStatefulWidget {
  final String? weekday;
  final bool isPlanEdit;
  const SearchExMainWidget(
      {super.key, required this.isPlanEdit, required this.weekday});

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
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (context, StateSetter setModalBottomSheetState) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 80),
                              child: ListView(
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
                                                toggleable: true,
                                                value: bodyPartList[index],
                                                groupValue: _bodyPartFilter,
                                                onChanged: (value) {
                                                  setModalBottomSheetState(() {
                                                    _bodyPartFilter = value;
                                                    ref
                                                        .read(
                                                            bodyPartFilterProvider
                                                                .notifier)
                                                        .state = value;
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
                                                toggleable: true,
                                                value: targetList[index],
                                                groupValue: _targetFilter,
                                                onChanged: (value) {
                                                  setModalBottomSheetState(() {
                                                    _targetFilter = value;
                                                    ref
                                                        .read(
                                                            targetFilterProvider
                                                                .notifier)
                                                        .state = value;
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
                                                toggleable: true,
                                                value: equipmentList[index],
                                                groupValue: _equipmentFilter,
                                                onChanged: (value) {
                                                  setModalBottomSheetState(() {
                                                    _equipmentFilter = value;
                                                    ref
                                                        .read(
                                                            equipmentFilterProvider
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
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          _resetFilters();
                                          setModalBottomSheetState(() {
                                            _bodyPartFilter = null;
                                            _equipmentFilter = null;
                                            _targetFilter = null;
                                          });
                                          context.pop();
                                        },
                                        child: Text('Сбросить')),
                                    ElevatedButton(
                                        onPressed: () {
                                          _saveFilters();
                                          context.pop();
                                        },
                                        child: Text('Сохранить'))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
                child: Text('filters')),
          ],
        ),
      ],
    );
  }
}
