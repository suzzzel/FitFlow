import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';

abstract class DoTheTrainDomainRepoImpl {
  Future<void> completeTrain({required TempTrainModel train});
}
