import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_tab_state.freezed.dart';
part 'root_tab_state.g.dart';

@freezed
class RootTabState with _$RootTabState {
  factory RootTabState({
    @Default(0) int index,
}) = _RootTabState;

  factory RootTabState.fromJson(Map<String, dynamic> json) => _$RootTabStateFromJson(json);
}
