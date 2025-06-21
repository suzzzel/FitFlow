// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/progress/data/repo/main_progress_repo.dart';
import 'package:fitflow/features/progress/domain/models/main_progress_model.dart';
import 'package:fitflow/features/progress/domain/repo/main_progress_domain_impl.dart';

class MainProgressDomain implements MainProgressDomainImpl {
  final MainProgressRepo dataRepo;
  MainProgressDomain({
    required this.dataRepo,
  });
  @override
  Future<MainProgressModel> getMainProgress() async {
    final mainProgress = await dataRepo.getMainProgressAboutUser();
    return mainProgress!;
  }
}
