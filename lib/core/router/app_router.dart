import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/domain/entities/bottle.dart';
import '../../features/presentation/pages/bottle_detail_page.dart';
import '../../features/presentation/pages/camera/camera_view.dart';
import '../../features/presentation/pages/camera/screens/photo_showing_screen.dart';
import '../../features/presentation/pages/collection_page.dart';
import '../../features/presentation/pages/scan_page.dart';
import '../../features/presentation/pages/settings_page.dart';
import '../../features/presentation/pages/shop_page.dart';
import '../../features/presentation/pages/sig_in/bloc/sign_in_bloc.dart';
import '../../features/presentation/pages/sig_in/sign_in_page.dart';
import '../../features/presentation/pages/sig_in/welcome_page.dart';
import '../../features/presentation/pages/splash/splash_page.dart';
import '../../features/presentation/widgets/bottom_nav_wrapper.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => BlocProvider(
        create: (context) => SignInBloc(),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) => const CameraView(),
    ),
    GoRoute(
      path: '/photo-showing',
      builder: (context, state) {
        final imagePath = state.extra as String;
        return PhotoShowingScreen(imagePath: imagePath);
      },
    ),

    ShellRoute(
      builder: (context, state, child) => BottomNavWrapper(child: child),
      routes: [
        GoRoute(
          path: '/collection',
          builder: (context, state) => CollectionPage(),
        ),
        GoRoute(
          path: '/shop',
          builder: (context, state) => const ShopPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: '/scan',
          builder: (context, state) => const ScanPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/bottle/:id',
      builder: (context, state) {
        final bottle = state.extra as Bottle;
        return BottleDetailPage(bottle: bottle);
      },
    ),
  ],
);