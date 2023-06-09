import 'package:flutter/material.dart';
import 'package:flutter_provider/layout/default_layout.dart';
import 'package:flutter_provider/riverpod/future_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: "FutureProviderScreen",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
              data: (date) {
                return Text(
                  date.toString(),
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stack) => Text(
                    error.toString(),
                  ),
              loading: () => Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
