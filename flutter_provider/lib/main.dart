import 'package:flutter/material.dart';
import 'package:flutter_provider/riverpod/provider_observer.dart';
import 'package:flutter_provider/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
