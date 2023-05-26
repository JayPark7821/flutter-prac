
import 'package:clean_arc_with_riverpod/presentation/root/root_tab_event.dart';
import 'package:clean_arc_with_riverpod/presentation/root/root_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/colors.dart';
import '../../common/di/denpendencies.dart';
import '../../common/layout/default_layout.dart';

class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  const RootTab({Key? key}) : super(key: key);

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener(){
    setState(() {
      int index = controller.index;
      ref.watch(rootTabViewModel).onEvent(RootTabEvent.tabIndexChange(index));
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(rootTabViewModel);
    return DefaultLayout(
      title: "CLEAN ARC",
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          controller.animateTo(index);
        },
        currentIndex: viewModel.state.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: "음식",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: "주문",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "프로필",
          ),
        ],
      ),
      child: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(child: Text("1"),),
          Center(child: Text("2"),),
          Center(child: Text("3"),),
          Center(child: Text("4"),),
        ],
      ),
    );
  }
}
