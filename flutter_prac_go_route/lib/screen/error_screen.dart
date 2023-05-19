import 'package:flutter/material.dart';
import 'package:flutter_prac_go_route/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({
    required this.error,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('go Home'),
          ),
        ],
      ),
    );
  }
}
