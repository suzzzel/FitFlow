import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/data/providers/search_ex_data_provider.dart';
import 'package:fitflow/features/search/search_ex/domain/providers/next_page_search_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_result_domain_provider.g.dart';

@riverpod
class SearchResultDomainProvider extends _$SearchResultDomainProvider {
  List<ExerciseModel> _fetchInitExercises() {
    return [];
  }

  @override
  FutureOr<List<ExerciseModel>> build() {
    return _fetchInitExercises();
  }

  Future<void> searchExercise(
      {required String nameOfExercise, required int numberOfPage}) async {
    final searchDataProvider = ref.read(searchExDataProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await searchDataProvider.searchExercisesByUserRequest(
          nameOfExercise: nameOfExercise, numberOfPage: numberOfPage);
    });
  }

  Future<void> newDownloadNextPage(
      {required String nameOfExercise, required int prevPage}) async {
    final nextPageExist = ref.read(nextPageSearchProvider);
    if (!nextPageExist) return;
    final searchDataProvider = ref.read(searchExDataProvider);
    final prevValue = state.value!;

    state =
        const AsyncValue<List<ExerciseModel>>.loading().copyWithPrevious(state);
    try {
      final nextPage = await searchDataProvider.searchExercisesByUserRequest(
          nameOfExercise: nameOfExercise, numberOfPage: prevPage + 1);
      ref.read(nextPageSearchProvider.notifier).state = nextPage.isNotEmpty;
      state = AsyncData([...prevValue, ...nextPage]);
    } catch (e, st) {
      state =
          AsyncValue<List<ExerciseModel>>.error(e, st).copyWithPrevious(state);
    }
  }
}
