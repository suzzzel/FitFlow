import 'package:fitflow/features/progress/domain/providers/main_progress_future_provider.dart';
import 'package:fitflow/features/train/get_temp_week_and_today_train_progress/domain/models/training_day_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDayIndexProvider = StateProvider<int>((ref) {
  final progress = ref.watch(getMainProgressProvider);
  return progress.maybeWhen(
    data: (data) => _getInitialPage(listOfTrainings: data.listOfTrainings),
    orElse: () => 0,
  );
});

int _getInitialPage({required List<TrainingDayClass> listOfTrainings}) {
  final timeNow = DateTime.now();
  final dateToFind = '${timeNow.year}-${timeNow.month}-${timeNow.day}';
  final potenitialPage =
      listOfTrainings.indexWhere((day) => day.dayOfTraining == dateToFind);
  if (potenitialPage != -1) {
    return potenitialPage;
  } else if (listOfTrainings.indexWhere((day) =>
          day.dayOfTraining!.substring(0, 4) == timeNow.year.toString() &&
          day.dayOfTraining!.substring(5, 6) == timeNow.month.toString()) !=
      -1) {
    return listOfTrainings.indexWhere((day) =>
        day.dayOfTraining!.substring(0, 4) == timeNow.year.toString() &&
        day.dayOfTraining!.substring(5, 6) == timeNow.month.toString());
  } else if (listOfTrainings.indexWhere((day) =>
          day.dayOfTraining!.substring(0, 4) == timeNow.year.toString()) !=
      -1) {
    return listOfTrainings.indexWhere(
        (day) => day.dayOfTraining!.substring(0, 4) == timeNow.year.toString());
  } else {
    return listOfTrainings.length ~/ 2;
  }
}
