import 'package:flutter/material.dart';
import 'package:flutter_provider/layout/default_layout.dart';
import 'package:flutter_provider/riverpod/auto_dispose_modifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);
    return DefaultLayout(
        title: "AutoDisposeModifierScreen",
        body: Center(
          child: state.when(
              data: (data) => Text(
                    data.toString(),
                  ),
              error: (error, stack) => Text(
                    error.toString(),
                  ),
              loading: () => CircularProgressIndicator()),
        ));
  }
}
