// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitflow/features/train/do_the_train/data/repo/do_the_train_data_repo.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/repo/do_the_train_domain_repo_impl.dart';

class DoTheTrainDomainRepo implements DoTheTrainDomainRepoImpl {
  final DoTheTrainDataRepo dataRepo;
  DoTheTrainDomainRepo({
    required this.dataRepo,
  });
  @override
  Future<bool> completeTrain({required TempTrainModel train}) async {
    return await dataRepo.saveTrainEndExit(train: train);
  }

  @override
  Future<bool> exitFromTrainWithoutSaving() async {
    return await dataRepo.exitFromTrainWithoutSave();
  }

  @override
  Future<void> startTrain() async {
    await dataRepo.startTrain();
  }

  @override
  Future<void> nextExercise({required TempTrainModel train}) async {
    await dataRepo.nextExercise(train: train);
  }

  @override
  Future<void> exitFromTrainingWhenAppCrash() async {
    return await dataRepo.exitFromTrainWhenTrainIsOver();
  }
}
