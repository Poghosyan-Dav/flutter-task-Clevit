import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/color/color_scheme.dart';

import '../../utilities/color/app_colors.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  bool _isLoaderShown = false;

  AppColors getColors(BuildContext context) => Theme.of(context).colorScheme.appColors;
  TextTheme getFonts(BuildContext context) => Theme.of(context).textTheme;
  Size getSizes(BuildContext context) => MediaQuery.of(context).size;



  void hideLoading(BuildContext context) {
    if (_isLoaderShown) {
      Navigator.pop(context);
      _isLoaderShown = false;
    }
  }

  void hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    hideLoading(context);
    super.dispose();
  }
}
