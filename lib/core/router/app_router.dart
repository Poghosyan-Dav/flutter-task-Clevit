import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/domain/entities/bottle.dart';

import '../../features/presentation/pages/bottle_detail_page.dart';
import '../../features/presentation/pages/collection_page.dart';
import '../../features/presentation/pages/scan_page.dart';
import '../../features/presentation/pages/settings_page.dart';
import '../../features/presentation/pages/shop_page.dart';
import '../../features/presentation/pages/sig_in/sign_in_page.dart';
import '../../features/presentation/pages/sig_in/welcome_page.dart';
import '../../features/presentation/pages/splash/splash_page.dart';
import '../../features/presentation/widgets/bottom_nav_wrapper.dart';


final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // Splash and Auth routes outside of Shell
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    ShellRoute(
      builder: (context, state, child) => BottomNavWrapper(child: child),
      routes: [
        GoRoute(
          path: '/collection',
          builder: (context, state) => const CollectionPage(),
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
