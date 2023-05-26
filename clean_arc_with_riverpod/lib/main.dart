
import 'package:clean_arc_with_riverpod/presentation/root/root_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "NotoSans",
        ),
        debugShowCheckedModeBanner: false,
        home: RootTab());
  }
}
