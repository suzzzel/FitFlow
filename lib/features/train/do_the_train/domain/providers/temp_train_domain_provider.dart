import 'dart:developer';

import 'package:fitflow/features/train/do_the_train/domain/models/temp_train_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempTrainNotifier extends StateNotifier<TempTrainModel> {
  TempTrainNotifier(super.state);

  void initTrain(TempTrainModel tempTrain) {
    state = tempTrain;
  }

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
