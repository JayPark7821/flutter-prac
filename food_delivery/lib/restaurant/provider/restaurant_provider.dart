import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/common/provider/pagination_provider.dart';

import '../model/restaurant_model.dart';
import '../repository/restaurant_repository.dart';

final restaurantDetailProvider =
    Provider.family<RestaurantModel?, String>((ref, id) {
  final state = ref.watch(restaurantProvider);

  if (state is! CursorPaginationModel) {
    return null;
  }
  return state.data.firstWhereOrNull((element) => element.id == id);
});

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);
  return notifier;
});

class RestaurantStateNotifier
    extends PaginationProvider<RestaurantModel, RestaurantRepository> {
  RestaurantStateNotifier({required super.repository});

  void getDetail({
    required String id,
  }) async {
    // 만약 아직 데이터가 하나도 없는 상태 (cursorPaginationModel 아니라면)
    // 데이터를 가져오는 시도
    if (state is! CursorPaginationModel) await this.paginate();

    // state가 cursorPaginationModel이 아닐때 그냥 리턴
    if (state is! CursorPaginationModel) return;

    final pState = state as CursorPaginationModel;
    final response = await repository.getRestaurantDetail(id: id);

    if (pState.data.where((element) => element.id == id).isEmpty) {
      state = pState.copyWith(
        data: <RestaurantModel>[
          ...pState.data,
          response,
        ],
      );
    } else {
      state = pState.copyWith(
        data: pState.data
            .map<RestaurantModel>((e) => e.id == id ? response : e)
            .toList(),
      );
    }
  }
}
