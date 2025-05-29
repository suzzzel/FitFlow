import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:fitflow/features/train/get_today_train_info/domain/providers/get_today_train_info_domain_provider.dart';
import 'package:fitflow/features/train/get_training_plan/domain/models/training_plan_class.dart';
import 'package:fitflow/features/train/get_training_plan/domain/providers/get_training_plan_domain_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TempTrainNotifier extends StateNotifier<TempTrainModel> {
  TempTrainNotifier(super.state);

  void completeExercise(
      {required String maxWeightOnThatExercise,
      required int countOfRepsOnThatExercise}) {
    TempTrainModel tempState = state;
    switch (state.tempExercise) {
      case 1:
        tempState = tempState.copyWith(
            exOneSkipped: countOfRepsOnThatExercise == 0 ? true : false,
            countRepsExOne: countOfRepsOnThatExercise == 0
                ? null
                : countOfRepsOnThatExercise,
            tempExercise: tempState.tempExercise + 1,
            maxWeightExOne: maxWeightOnThatExercise == '0'
                ? null
                : maxWeightOnThatExercise);
        state = tempState;
        break;
      case 2:
        tempState = tempState.copyWith(
            exTwoSkipped: countOfRepsOnThatExercise == 0 ? true : false,
            countRepsExTwo: countOfRepsOnThatExercise == 0
                ? null
                : countOfRepsOnThatExercise,
            tempExercise: tempState.tempExercise + 1,
            maxWeightExTwo: maxWeightOnThatExercise == '0'
                ? null
                : maxWeightOnThatExercise);
        state = tempState;
        break;
      case 3:
        tempState = tempState.copyWith(
            exThreeSkipped: countOfRepsOnThatExercise == 0 ? true : false,
            countRepsExThree: countOfRepsOnThatExercise == 0
                ? null
                : countOfRepsOnThatExercise,
            tempExercise: tempState.tempExercise + 1,
            maxWeightExThree: maxWeightOnThatExercise == '0'
                ? null
                : maxWeightOnThatExercise);
        state = tempState;
        break;
      case 4:
        tempState = tempState.copyWith(
            exFourSkipped: countOfRepsOnThatExercise == 0 ? true : false,
            countRepsExFour: countOfRepsOnThatExercise == 0
                ? null
                : countOfRepsOnThatExercise,
            tempExercise: tempState.tempExercise + 1,
            maxWeightExFour: maxWeightOnThatExercise == '0'
                ? null
                : maxWeightOnThatExercise);
        state = tempState;
        break;
      case 5:
        tempState = tempState.copyWith(
            exFiveSkipped: countOfRepsOnThatExercise == 0 ? true : false,
            countRepsExFive: countOfRepsOnThatExercise == 0
                ? null
                : countOfRepsOnThatExercise,
            tempExercise: tempState.tempExercise + 1,
            maxWeightExFive: maxWeightOnThatExercise == '0'
                ? null
                : maxWeightOnThatExercise);
        state = tempState;
        break;
    }
    state = tempState;
  }

  void skipExercise({required int tempExercise}) {
    TempTrainModel tempState = state;
    switch (tempExercise) {
      case 1:
        tempState = tempState.copyWith(
            exOneSkipped: false, tempExercise: tempState.tempExercise + 1);
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
  final isTrainAlreadyExist =
      ref.watch(getTodayTrainInfoDomainProviderAsyncProvider);
  return trainingPlan.when(
      data: (data) {
        final weekDayNow = DateFormat('EEEE').format(timeNow).toLowerCase();
        if (data.indexWhere((element) => element.dayOfWeek == weekDayNow) ==
            -1) {
          ref.read(completeTrainProvider).exitFromTrainWithoutSaving();
          return TempTrainNotifier(TempTrainModel.empty());
        } else {
          final TrainingPlanClass thisTrain = data[
              data.indexWhere((element) => element.dayOfWeek == weekDayNow)];
          return isTrainAlreadyExist.when(
              data: (existTrain) {
                final prevTrain =
                    _checkPrevTrain(existTrain: existTrain, idUser: user.id!);
                if (prevTrain == null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 1,
                    mainMuscle: thisTrain.mainMuscle,
                    secondaryMuscle: thisTrain.secondaryMuscle,
                    exerciseOne: thisTrain.exerciseOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    exerciseFour: thisTrain.exerciseFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                } else if (prevTrain.countRepsExFive != null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 5,
                    exerciseOne: thisTrain.exerciseOne,
                    countRepsExOne: prevTrain.countRepsExOne,
                    maxWeightExOne: prevTrain.maxWeightExOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    countRepsExTwo: prevTrain.countRepsExTwo,
                    maxWeightExTwo: prevTrain.maxWeightExTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    countRepsExThree: prevTrain.countRepsExThree,
                    maxWeightExThree: prevTrain.maxWeightExThree,
                    exerciseFour: thisTrain.exerciseFour,
                    countRepsExFour: prevTrain.countRepsExFour,
                    maxWeightExFour: prevTrain.maxWeightExFour,
                    exerciseFive: thisTrain.exerciseFive,
                    countRepsExFive: prevTrain.countRepsExFive,
                    maxWeightExFive: prevTrain.maxWeightExFive,
                  );
                  return TempTrainNotifier(train);
                } else if (prevTrain.countRepsExFour != null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 5,
                    exerciseOne: thisTrain.exerciseOne,
                    countRepsExOne: prevTrain.countRepsExOne,
                    maxWeightExOne: prevTrain.maxWeightExOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    countRepsExTwo: prevTrain.countRepsExTwo,
                    maxWeightExTwo: prevTrain.maxWeightExTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    countRepsExThree: prevTrain.countRepsExThree,
                    maxWeightExThree: prevTrain.maxWeightExThree,
                    exerciseFour: thisTrain.exerciseFour,
                    countRepsExFour: prevTrain.countRepsExFour,
                    maxWeightExFour: prevTrain.maxWeightExFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                } else if (prevTrain.countRepsExThree != null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 4,
                    exerciseOne: thisTrain.exerciseOne,
                    countRepsExOne: prevTrain.countRepsExOne,
                    maxWeightExOne: prevTrain.maxWeightExOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    countRepsExTwo: prevTrain.countRepsExTwo,
                    maxWeightExTwo: prevTrain.maxWeightExTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    countRepsExThree: prevTrain.countRepsExThree,
                    maxWeightExThree: prevTrain.maxWeightExThree,
                    exerciseFour: thisTrain.exerciseFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                } else if (prevTrain.countRepsExTwo != null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 3,
                    exerciseOne: thisTrain.exerciseOne,
                    countRepsExOne: prevTrain.countRepsExOne,
                    maxWeightExOne: prevTrain.maxWeightExOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    countRepsExTwo: prevTrain.countRepsExTwo,
                    maxWeightExTwo: prevTrain.maxWeightExTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    exerciseFour: thisTrain.exerciseFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                } else if (prevTrain.countRepsExOne != null) {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 2,
                    exerciseOne: thisTrain.exerciseOne,
                    countRepsExOne: prevTrain.countRepsExOne,
                    maxWeightExOne: prevTrain.maxWeightExOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    exerciseFour: thisTrain.exerciseFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                } else {
                  final train = TempTrainModel(
                    idUser: user.id!,
                    dayOfTraining: dayOfTraining,
                    tempExercise: 1,
                    mainMuscle: thisTrain.mainMuscle,
                    secondaryMuscle: thisTrain.secondaryMuscle,
                    exerciseOne: thisTrain.exerciseOne,
                    exerciseTwo: thisTrain.exerciseTwo,
                    exerciseThree: thisTrain.exerciseThree,
                    exerciseFour: thisTrain.exerciseFour,
                    exerciseFive: thisTrain.exerciseFive,
                  );
                  return TempTrainNotifier(train);
                }
              },
              error: (_, st) {
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
              },
              loading: () => TempTrainNotifier(TempTrainModel.empty()));
        }
      },
      error: (_, st) => TempTrainNotifier(TempTrainModel.empty()),
      loading: () => TempTrainNotifier(TempTrainModel.empty()));
});

TrainingDayClass? _checkPrevTrain(
    {required TrainingDayClass? existTrain, required String idUser}) {
  if (existTrain == null) {
    return null;
  } else {
    return TrainingDayClass(
        isChillday: false,
        isTrainOver: false,
        idUser: idUser,
        dayOfTraining: existTrain.dayOfTraining,
        mainMuscle: existTrain.mainMuscle,
        exerciseOne: existTrain.exerciseOne,
        countRepsExOne: existTrain.countRepsExOne,
        maxWeightExOne: existTrain.maxWeightExOne,
        exerciseTwo: existTrain.exerciseTwo,
        countRepsExTwo: existTrain.countRepsExTwo,
        maxWeightExTwo: existTrain.maxWeightExTwo,
        exerciseThree: existTrain.exerciseThree,
        countRepsExThree: existTrain.countRepsExThree,
        maxWeightExThree: existTrain.maxWeightExThree,
        exerciseFour: existTrain.exerciseFour,
        countRepsExFour: existTrain.countRepsExFour,
        maxWeightExFour: existTrain.maxWeightExFour,
        exerciseFive: existTrain.exerciseFive,
        countRepsExFive: existTrain.countRepsExFive,
        maxWeightExFive: existTrain.maxWeightExFive,
        percentOfTrainDone: existTrain.percentOfTrainDone);
  }
}
