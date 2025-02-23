// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:fitflow/features/db/app_database.dart';
import 'package:fitflow/features/home/home_main_screen/data/repo/home_quotes_repo_impl.dart';

class HomeQuotesRepo implements HomeQuotesRepoImpl {
  final AppDatabase database;

  HomeQuotesRepo({
    required this.database,
  });

  @override
  Future<List<String>> getDayQuote() async {
    final manager = database.managers;
    final tempQuoteId = Random().nextInt(4) + 1;
    try {
      final quote = await manager.quotesTable
          .filter((f) => f.id(tempQuoteId))
          .getSingle();
      return [quote.firstPart, quote.secondPart];
    } catch (e) {
      rethrow;
    }
  }
}
