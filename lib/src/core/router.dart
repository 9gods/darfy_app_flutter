import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/auth/login_drawer.dart';
import '../features/home/home_screen.dart';
import '../features/camera/camera_screen.dart';

final router = GoRouter(
  initialLocation: '/onboard',
  routes: [
    GoRoute(path: '/onboard', builder: (_, __) => const OnboardingScreen()),
    GoRoute(
      path: '/login',
      pageBuilder: (_, __) => const CupertinoPage(
        child: LoginDrawer(),
        fullscreenDialog: false,
      ),
    ),
    GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/camera', builder: (_, __) => const CameraScreen()),
  ],
);
