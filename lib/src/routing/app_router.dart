import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/src/features/authentication/data/auth_repository.dart';
import 'package:flutter_template/src/features/authentication/presentation/account_screen.dart';
import 'package:flutter_template/src/features/authentication/presentation/sign_in_screen.dart';

import 'go_router_refresh_stream.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  onboarding,
  signIn,
  jobs,
  job,
  addJob,
  editJob,
  entry,
  addEntry,
  editEntry,
  entries,
  profile,
}

@riverpod
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/signIn',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      debugPrint(isLoggedIn.toString());
      if (isLoggedIn) {
        if (state.location.startsWith('/signIn')) {
          return '/account';
        }
      } else {
        if (state.location.startsWith('/account')) {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: '/account',
        name: AppRoute.profile.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AccountScreen(),
        ),
      ),
    ],
  );
}
