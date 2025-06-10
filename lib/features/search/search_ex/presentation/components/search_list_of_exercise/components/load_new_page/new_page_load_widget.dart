import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/filter_providers_domain.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/next_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/search_list_of_exercise/components/load_new_page/components/exercise_by_request_is_end_text.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/search_list_of_exercise/components/load_new_page/components/load_new_page_button.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/components/smth_goes_wrong_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNewPageWidget extends ConsumerWidget {
  final String tempRequest;

  const LoadingNewPageWidget({
    super.key,
    required this.tempRequest,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvState = ref.watch(searchResultDomainProviderProvider);
    final nextPageProv = ref.watch(nextPageSearchProvider);
    final currenPageProv = ref.watch(currentSearchPageProvider);
    final bodyPartFilter = ref.watch(bodyPartFilterProvider);
    final equipmentFilter = ref.watch(equipmentFilterProvider);
    final targetFilter = ref.watch(targetFilterProvider);
    return switch (searchProvState) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      // Ошибка с сетью и другие эксепшены
      AsyncError() => const SomethingGoesWrongWidget(),
      _ when !nextPageProv => const ExerciseByRequestIsEndText(),
      _ when searchProvState.value!.isNotEmpty && !searchProvState.isLoading =>
        // Можно загрузить следующую страницу
        LoadNewPageButton(
            bodyPartFilter: bodyPartFilter,
            equipmentFilter: equipmentFilter,
            targetFilter: targetFilter,
            tempRequest: tempRequest,
            currenPageProv: currenPageProv),
      _ when searchProvState.isLoading =>
        // Ждем загрузки упражнений
        const Center(child: CircularProgressIndicator()),
      _ => const SizedBox(),
    };
  }
}
