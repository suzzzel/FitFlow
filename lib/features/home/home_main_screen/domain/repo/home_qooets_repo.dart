// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/home/home_main_screen/data/repo/home_quotes_repo.dart';
import 'package:fitflow/features/home/home_main_screen/domain/repo/home_quotes_domain_impl.dart';

class HomeQuotesRepoDomain implements HomeQuotesDomainImpl {
  final HomeQuotesRepo homeQuotesRepo;
  HomeQuotesRepoDomain({
    required this.homeQuotesRepo,
  });
  @override
  Future<List<String>> getDayQuote() async {
    return await homeQuotesRepo.getDayQuote();
  }
}
