import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/root/root_tab.dart';
import '../../presentation/splash/splash_screen.dart';

class RouterConfig extends ChangeNotifier{
  final FlutterSecureStorage storage;

  RouterConfig({required this.storage});

  String? redirectLogic(BuildContext context, GoRouterState state) {

    return state.location == '/splash' ? '/' : null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => SplashScreen(),
        ),
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (_, __) => RootTab(),
        ),
      ];
}
