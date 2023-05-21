import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/view/root_tab.dart';
import 'package:food_delivery/common/view/splash_screen.dart';
import 'package:food_delivery/restaurant/view/basket_screen.dart';
import 'package:food_delivery/restaurant/view/restaurant_detail_screen.dart';
import 'package:food_delivery/user/model/user_model.dart';
import 'package:food_delivery/user/provider/user_me_provider.dart';
import 'package:food_delivery/user/view/login_screen.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({required this.ref}) {
    ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
            path: '/',
            name: RootTab.routeName,
            builder: (_, __) => RootTab(),
            routes: [
              GoRoute(
                  path: 'restaurant/:rid',
                  name: RestaurantDetailScreen.routeName,
                  builder: (_, state) =>
                      RestaurantDetailScreen(id: state.pathParameters['rid']!))
            ]),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (_, __) => LoginScreen(),
        ),
        GoRoute(
          path: '/basket',
          name: BasketScreen.routeName,
          builder: (_, __) => BasketScreen(),
        ),
      ];

  void logout() {
    ref.read(userMeProvider.notifier).logout();
    notifyListeners();
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final UserModelBase? user = ref.read(userMeProvider);
    final logginIn = state.location == '/login';

    if (user == null) {
      return logginIn ? null : '/login';
    }

    if (user is UserModel) {
      return logginIn || state.location == '/splash' ? '/' : null;
    }
    if (user is UserModelError) {
      return !logginIn ? '/login' : null;
      // 토큰 삭
    }
    return null;
  }
}
