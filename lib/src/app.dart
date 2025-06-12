import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/onboarding/onboarding_screen.dart';
import 'features/home/home_screen.dart';
import 'features/camera/camera_screen.dart';

class DarfyApp extends ConsumerWidget {
  const DarfyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      initialLocation: '/onboard',
      routes: [
        GoRoute(
          path: '/onboard',
          builder: (_, __) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: '/camera',
          builder: (_, __) => const CameraScreen(),
        ),
      ],
    );

    return CupertinoApp.router(
      title: 'Darfy',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      routerConfig: router,
    );
  }
}
