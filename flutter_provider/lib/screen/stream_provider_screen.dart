import 'package:flutter/material.dart';
import 'package:flutter_provider/layout/default_layout.dart';
import 'package:flutter_provider/riverpod/stream_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
      title: "StreamProviderScreen",
      body: Center(
        child: state.when(
            data: (data) => Text(
                  data.toString(),
                ),
            error: (error, stack) => Text(
                  error.toString(),
                ),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
