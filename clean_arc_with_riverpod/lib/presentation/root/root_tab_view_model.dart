import 'dart:async';

import 'package:clean_arc_with_riverpod/presentation/root/root_tab_event.dart';
import 'package:clean_arc_with_riverpod/presentation/root/root_tab_state.dart';



class RootTabViewModel {
  RootTabViewModel();

  RootTabState _state = RootTabState();

  RootTabState get state => _state;

  final _eventController = StreamController<RootTabEvent>();

  Stream<RootTabEvent> get eventStream => _eventController.stream;

  void onEvent(RootTabEvent event) {
    event.when(tabIndexChange: (index) => _setTabIndex(index: index));
  }

  void _setTabIndex({required int index}) {
    _state = state.copyWith(
      index: index,
    );
  }
}
