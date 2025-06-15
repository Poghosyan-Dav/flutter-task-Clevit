import 'package:flutter/material.dart';
import 'package:flutter_clevit_task/features/presentation/utilities/assets/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavWrapper extends StatelessWidget {
  final Widget child;

  const BottomNavWrapper({super.key, required this.child});

  int _locationToIndex(String location) {
    if (location.startsWith('/scan')) return 0;
    if (location.startsWith('/collection')) return 1;
    if (location.startsWith('/shop')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 1; // default to Collection
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/scan');
              break;
            case 1:
              context.go('/collection');
              break;
            case 2:
              context.go('/shop');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items:  [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppAssets.scanBottomBarIcon), label: 'Scan'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppAssets.squaresFourBottomBarIcon), label: 'Collection'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppAssets.shopBottomBarIcon), label: 'Shop'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppAssets.settingsBottomBarIcon), label: 'Settings'),
        ],
      ),
    );
  }
}
