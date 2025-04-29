import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultDomainNotifier extends StateNotifier<List<ExerciseModel>> {
  SearchResultDomainNotifier() : super(List.empty());

  void resetSearchResult() {
    state = [];
  }

  void addSearchResult({required List<ExerciseModel> results}) {
    resetSearchResult();
    state = results;
  }
}
