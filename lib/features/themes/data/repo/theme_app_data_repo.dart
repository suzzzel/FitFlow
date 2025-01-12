import 'dart:developer';

import 'package:fitflow/features/themes/data/models/theme_dark.dart';
import 'package:fitflow/features/themes/data/models/theme_light.dart';
import 'package:fitflow/features/themes/data/repo/theme_app_data_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeAppDataRepo extends StateNotifier<ThemeData>
    implements ThemeAppDataRepoImpl {
  ThemeAppDataRepo() : super(lightTheme) {
    loadTheme();
  }

  @override
  Future<void> changeTheme() async {
    log('change theme');
    state = state == lightTheme ? darkTheme : lightTheme;
    final sp = await SharedPreferences.getInstance();
    await sp.setString('themeApp', state == darkTheme ? 'dark' : 'light');
  }

  @override
  Future<void> loadTheme() async {
    final sp = await SharedPreferences.getInstance();
    final theme = sp.getString('themeApp');
    if (theme != null) {
      state = theme == 'dark' ? darkTheme : lightTheme;
    }
  }
}
