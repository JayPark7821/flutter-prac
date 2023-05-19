import 'package:flutter/material.dart';
import 'package:flutter_prac_go_route/screen/1_screen.dart';
import 'package:flutter_prac_go_route/screen/2_screen.dart';
import 'package:flutter_prac_go_route/screen/3_screen.dart';
import 'package:flutter_prac_go_route/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        routes: [
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
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
