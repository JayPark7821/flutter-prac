import 'package:flutter/material.dart';
import 'package:flutter_prac_go_route/screen/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../model/user_model.dart';
import '../screen/1_screen.dart';
import '../screen/2_screen.dart';
import '../screen/3_screen.dart';
import '../screen/error_screen.dart';
import '../screen/home_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authStateProvider = AuthNotifier(
      ref: ref,
    );

    return GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state) {
        return ErrorScreen(
          error: state.error.toString(),
        );
      },
      routes: authStateProvider._routes,
      redirect: authStateProvider._redirectLogic,
      refreshListenable: authStateProvider,
    );
  },
);

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({
    required this.ref,
  }) {
    ref.listen<UserModel?>(
      userProvider,
      (previous, next) {
        if (previous != null) {
          notifyListeners();
        }
      },
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final user = ref.read(userProvider);
    final loggingIn = state.location == '/login';

    if (user == null) {
      return loggingIn ? '/' : '/login';
    }

    if (loggingIn) {
      return '/';
    }

    return '/';
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (_, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'one',
              builder: (_, state) => OneScreen(),
              routes: [
                GoRoute(
                  path: 'two',
                  builder: (_, state) => TwoScreen(),
                  routes: [
                    GoRoute(
                      path: 'three',
                      name: ThreeScreen.routeName,
                      builder: (_, state) => ThreeScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (_, state) => LoginScreen(),
        ),
      ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
    (ref) => UserStateNotifier());

class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({
    required String name,
  }) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
