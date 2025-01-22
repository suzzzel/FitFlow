import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectHeightMainProvider = StateProvider<int>((ref) => 50);

final selectHeightPrevOneProvider = StateProvider.autoDispose<int>((ref) {
  final mainHeight = ref.watch(selectHeightMainProvider);
  return mainHeight - 1;
});

final selectHeightNextOneProvider = StateProvider.autoDispose<int>((ref) {
  final mainHeight = ref.watch(selectHeightMainProvider);
  return mainHeight + 1;
});
