import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectWeekdayCustomPlanNotifier extends StateNotifier<List<String>> {
  SelectWeekdayCustomPlanNotifier() : super([]);

  void addWeekday(String weekday) {
    if (!state.contains(weekday)) {
      state = [...state, weekday];
    } else {}
  }

  void removeWeekday(String weekday) {
    if (state.contains(weekday)) {
      state = [
        for (final day in state)
          if (day != weekday) day,
      ];
    }
  }
}

final selectWeekdayCustomPlanProvider =
    StateNotifierProvider<SelectWeekdayCustomPlanNotifier, List<String>>((ref) {
  return SelectWeekdayCustomPlanNotifier();
});
