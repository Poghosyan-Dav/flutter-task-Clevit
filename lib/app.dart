import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/typography/text_theme.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_state.dart';
import 'package:flutter_clevit_task/features/presentation/widgets/base/base_stateless_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'features/presentation/bloc/collection_bloc.dart';
import 'features/presentation/bloc/collection_event.dart';
import 'features/presentation/utilities/color/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<CollectionBloc>()
          ..add(const CollectionEvent.started()), // Initialize your bloc
      ),
    ], child:
         ScreenUtilInit(
        designSize: const Size(360, 690), // Set your design dimensions here
    minTextAdapt: true,
    builder: (_, child) {
    return MaterialApp.router(

    routerConfig: router,
    theme: ThemeData(
    colorScheme: ColorScheme.dark(
    primary: getColors(context).yellowColor,
    surface: getColors(context).mainAppColor,
    ),
    scaffoldBackgroundColor: getColors(context).mainAppColor,
    appBarTheme: AppBarTheme(
    backgroundColor: getColors(context).mainAppColor,
    iconTheme: IconThemeData(color: getColors(context).whiteColor),
    titleTextStyle: Theme.of(context).textTheme.ebGaramondBold,
    ),
    iconTheme: IconThemeData(color: AppColors().whiteColor),
    textTheme: TextTheme(
    displayLarge: getFonts(context).ebGaramondBlack,
    displayMedium: getFonts(context).ebGaramondBold,
    bodyLarge: getFonts(context).ebGaramondRegular,
    bodyMedium: getFonts(context).ebGaramondMedium,
    labelLarge: getFonts(context).ebGaramondSemiBold,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    backgroundColor: getColors(context).yellowColor,
    foregroundColor: getColors(context).blackColor,
    textStyle: getFonts(context).ebGaramondBold,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.r), // Responsive radius
    ),
    padding: EdgeInsets.symmetric(
    vertical: 16.h, // Responsive padding
    horizontal: 24.w, // Responsive padding
    ),
    ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: getColors(context).bottomBarColor,
    selectedItemColor: getColors(context).yellowColor,
    unselectedItemColor: getColors(context).whiteColor,
    ),
    cardTheme: CardTheme(
    color: getColors(context).boxColors,
    margin: EdgeInsets.all(8.r), // Responsive margin
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.r), // Responsive radius
    ),
    ),
    ),
    );
    },
    )
    );
  }
}