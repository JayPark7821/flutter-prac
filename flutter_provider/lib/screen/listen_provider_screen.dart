import 'package:flutter/material.dart';
import 'package:flutter_provider/layout/default_layout.dart';
import 'package:flutter_provider/riverpod/listen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider.notifier).state,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      listenProvider,
      (previous, next) {
        controller.animateTo(next);
      },
    );
    return DefaultLayout(
      title: "ListenProviderScreen",
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 10 ? 10 : state + 1);
                },
                child: Text("next"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text("prev"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
