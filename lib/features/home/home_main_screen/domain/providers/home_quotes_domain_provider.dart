import 'package:fitflow/features/home/home_main_screen/data/providers/home_quotes_data_provider.dart';
import 'package:fitflow/features/home/home_main_screen/domain/repo/home_qooets_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_quotes_domain_provider.g.dart';

final homeQuotesDomainProvider = Provider<HomeQuotesRepoDomain>((ref) {
  final homeQuotesRepo = ref.watch(homeQuotesDataProvider);
  return HomeQuotesRepoDomain(homeQuotesRepo: homeQuotesRepo);
});

@riverpod
class HomeQuotesDataProviderAsync extends _$HomeQuotesDataProviderAsync {
  @override
  FutureOr<List<String>> build() {
    return [];
  }

  Future<List<String>> getQuote() async {
    final quoteRepo = ref.read(homeQuotesDomainProvider);
    state = await AsyncValue.guard(() async {
      final quote = await quoteRepo.getDayQuote();
      state = AsyncValue.data(quote);
      return quote;
    });
    return state.value!;
  }
}
