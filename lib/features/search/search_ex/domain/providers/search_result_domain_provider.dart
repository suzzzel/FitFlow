import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/search_ex/data/providers/search_ex_data_provider.dart';
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

  Future<void> downloadNextPage(
      {required String nameOfExercise, required int prevPage}) async {
    final searchDataProvider = ref.read(searchExDataProvider);
    final listOfEx = state.value!;
    state = await AsyncValue.guard(() async {
      final nextPage = await searchDataProvider.searchExercisesByUserRequest(
          nameOfExercise: nameOfExercise, numberOfPage: prevPage + 1);
      listOfEx.addAll(nextPage);
      return listOfEx;
    });
  }

  Future<void> newDownloadNextPage(
      {required String nameOfExercise, required int prevPage}) async {
    final searchDataProvider = ref.read(searchExDataProvider);
    final prevValue = state.value!;

    state =
        const AsyncValue<List<ExerciseModel>>.loading().copyWithPrevious(state);
    final result = await AsyncValue.guard(() async {
      final nextPage = await searchDataProvider.searchExercisesByUserRequest(
          nameOfExercise: nameOfExercise, numberOfPage: prevPage + 1);
      return [...prevValue, ...nextPage];
    });

    state = result.hasError
        ? AsyncValue<List<ExerciseModel>>.error(
                result.error!, result.stackTrace!)
            .copyWithPrevious(state)
        : AsyncValue.data(result.value!);
  }
}
