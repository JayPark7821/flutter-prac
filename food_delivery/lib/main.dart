import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/provider/go_router.dart';

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
    final _router = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "NotoSans",
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
