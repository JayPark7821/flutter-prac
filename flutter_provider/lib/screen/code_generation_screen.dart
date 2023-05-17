import 'package:flutter/material.dart';
import 'package:flutter_provider/layout/default_layout.dart';
import 'package:flutter_provider/riverpod/code_generation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProviderProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    return DefaultLayout(
      title: "CodeGenerationScreen",
      body: Column(
        children: [
          Text('State1 : $state1'),
          Text('State2 : $state2'),
          Text('State3 : $state3'),
        ],
      ),
    );
  }
}
