import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectWayOfCreatingTrainPlanProvider =
    StateProvider.autoDispose<int>((ref) => 0);
