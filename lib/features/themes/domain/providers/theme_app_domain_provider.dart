import 'package:fitflow/features/themes/data/repo/theme_app_data_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeAppDataRepo, ThemeData>((ref) {
  return ThemeAppDataRepo();
});
