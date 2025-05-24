import 'package:fitflow/features/train/do_the_train/data/providers/do_the_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/repo/do_the_train_domain_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final completeTrainProvider = Provider<DoTheTrainDomainRepo>((ref) {
  final dataProvider = ref.watch(doTheTrainDataProvider);
  return DoTheTrainDomainRepo(dataRepo: dataProvider);
});
