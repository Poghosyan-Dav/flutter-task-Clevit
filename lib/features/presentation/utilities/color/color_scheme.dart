import 'package:flutter/material.dart';
import 'app_colors.dart';

extension AppColorTheme on ColorScheme {
  static final _appColors = const AppColors();

  AppColors get appColors => _appColors;
}
