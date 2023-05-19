import 'package:flutter/material.dart';
import 'package:flutter_prac_go_route/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go('/one');
              },
              child: Text('Screen One Go'))
        ],
      ),
    );
  }
}
