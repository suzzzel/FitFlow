import 'package:fitflow/features/search/search_ex/domain/providers/current_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/filter_providers_domain.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/next_page_search_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/search_result_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNewPageButton extends ConsumerWidget {
  final String tempRequest;

  const LoadingNewPageButton({
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
      AsyncError(:final error) => Text('Ошибка загрузки: ${error.toString()}'),
      _ when !nextPageProv =>
        const Text('Больше упражнений нет', textAlign: TextAlign.center),
      _ when searchProvState.value!.isNotEmpty && !searchProvState.isLoading =>
        ElevatedButton(
          onPressed: () {
            if (bodyPartFilter != null ||
                equipmentFilter != null ||
                targetFilter != null) {
              ref
                  .read(searchResultDomainProviderProvider.notifier)
                  .newDownloadNextPage(
                      nameOfExercise: tempRequest,
                      prevPage: currenPageProv,
                      usingFilter: true,
                      bodyPartFilter: bodyPartFilter,
                      equipment: equipmentFilter,
                      targetMuscleFilter: targetFilter);
            } else {
              ref
                  .read(searchResultDomainProviderProvider.notifier)
                  .newDownloadNextPage(
                    nameOfExercise: tempRequest,
                    prevPage: currenPageProv,
                    usingFilter: false,
                  );
            }
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
