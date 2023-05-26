import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_tab_event.freezed.dart';

@freezed
 class RootTabEvent<T> with _$RootTabEvent<T> {
    const factory RootTabEvent.tabIndexChange(int index) = TabIndexChange;
}
