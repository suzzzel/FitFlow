import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentSearchPageProvider = StateProvider.autoDispose<int>((ref) => 0);
