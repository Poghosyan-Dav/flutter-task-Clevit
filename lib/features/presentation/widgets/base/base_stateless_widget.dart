// lib/features/presentation/widgets/base/base_stateless_widget.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/color/color_scheme.dart';

import '../../utilities/assets/app_assets.dart';
import '../../utilities/color/app_colors.dart';


abstract class BaseStatelessWidget extends StatelessWidget {

  const BaseStatelessWidget({super.key});


  AppColors getColors(BuildContext context) => Theme.of(context).colorScheme.appColors;
  TextTheme getFonts(BuildContext context) => Theme.of(context).textTheme;
  Size getSizes(BuildContext context) => MediaQuery.of(context).size;




  void hideLoading(BuildContext context) {
    Navigator.pop(context);

  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }


  Widget baseBuild(BuildContext context);

  @nonVirtual
  @override
  Widget build(BuildContext context) {

    return baseBuild(context);
  }
}
