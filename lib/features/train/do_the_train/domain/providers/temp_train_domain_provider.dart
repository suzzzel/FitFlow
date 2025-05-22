import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TempTrainNotifier extends StateNotifier<TempTrainModel> {
  TempTrainNotifier(super.state);

  void completeExercise() {
    TempTrainModel tempState = state;
    tempState = tempState.copyWith(tempExercise: tempState.tempExercise + 1);
    state = tempState;
  }

  void skipExercise({required int tempExercise}) {
    TempTrainModel tempState = state;
    switch (tempExercise) {
      case 1:
        tempState = tempState.copyWith(
            exOneSkipped: true, tempExercise: tempState.tempExercise + 1);
        state = tempState;
        break;
      case 2:
        tempState = tempState.copyWith(
            exTwoSkipped: true, tempExercise: tempState.tempExercise + 1);
        state = tempState;
        break;
      case 3:
        tempState = tempState.copyWith(
            exThreeSkipped: true, tempExercise: tempState.tempExercise + 1);
        state = tempState;
        break;
      case 4:
        tempState = tempState.copyWith(
            exFourSkipped: true, tempExercise: tempState.tempExercise + 1);
        state = tempState;
        break;
      case 5:
        tempState = tempState.copyWith(
            exFiveSkipped: true, tempExercise: tempState.tempExercise + 1);
        state = tempState;
        break;
    }
  }
}

final tempTrainStateNotifierProvider =
    StateNotifierProvider<TempTrainNotifier, TempTrainModel>((ref) {
  final userState = ref.watch(authStateProvider);
  final user = userState.value!.user!;
  final timeNow = DateTime.now();
  final dayOfTraining =
      DateTime.parse(DateFormat('yyyy-MM-dd').format(timeNow));
  final trainingPlan =
      ref.watch(getTrainingPlanDomainProviderAsyncProvider(id: user.id!));
  final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
  final TrainingPlanClass thisTrain = trainingPlan.value![trainingPlan.value!
      .indexWhere((element) => element.dayOfWeek == weekDayNow)];
  final train = TempTrainModel(
    idUser: user.id!,
    dayOfTraining: dayOfTraining,
    tempExercise: 1,
    exerciseOne: thisTrain.exerciseOne,
    exerciseTwo: thisTrain.exerciseTwo,
    exerciseThree: thisTrain.exerciseThree,
    exerciseFour: thisTrain.exerciseFour,
    exerciseFive: thisTrain.exerciseFive,
  );
  return TempTrainNotifier(train);
});
