import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/common/model/pagination_params.dart';

import '../model/restaurant_model.dart';
import '../repository/restaurant_repository.dart';

final restaurantDetailProvider =
    Provider.family<RestaurantModel?, String>((ref, id) {
  final state = ref.watch(restaurantProvider);

  if (state is! CursorPaginationModel) {
    return null;
  }
  return state.data.firstWhere((element) => element.id == id);
});

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);
  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({required this.repository})
      : super(CursorPaginationLoading()) {
    paginate();
  }

  Future<void> paginate({
    int fetchCount = 20,
    // 추가로 데이터 더 가져오기
    // true - 추가로 데이터 더 가져옴
    // false - 새로고침 (현재 상태를 덮어씌움)
    bool fetchMore = false,
    // 강제로 다시 로딩
    // true - CurcorPaginationLoading()
    bool forceRefetch = false,
  }) async {
    try {
      // final response = await repository.paginate();
      // state = response;

      // 5가지 가능성
      // state 상태
      // 1 CursorPagination - 정상적으로 데잍거ㅏ 있는 상태
      // 2 CursorPaginationLoading - 데이터가 로딩중인 상태 ( 현재 캐시 없음)
      // 3 CursorPaginationError - 에러
      // 4 CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때
      // 5 CursorPaginationFetchMore - 추가 데이터를 Paginate해오라는 요청을 받았을때

      // 바로 반환하는 상황
      // 1 hasMore = false 다음 데이터가 없을때
      // 2 로딩중 - fetchMore : true 새로운 데이터를 가져온느 도중에 다시 paginate 실행시
      //          fetchMore : false 다음 데이터를 가져오는도중에 위로 올려서 새로고칭 하는 상황
      if (state is CursorPaginationModel && !forceRefetch) {
        final pState = state as CursorPaginationModel;
        if (!pState.meta.hasMore) {
          return;
        }
      }
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      PaginationParams paginationParams = PaginationParams(
        count: fetchCount,
      );

      //fetchMore 데이터를 추가로 더 가져오는 상황
      if (fetchMore) {
        final pState = state as CursorPaginationModel;
        state = CursorPaginationFetchingMore(
          meta: pState.meta,
          data: pState.data,
        );

        paginationParams = paginationParams.copyWith(
          after: pState.data.last.id,
        );
        //데이터를 처음부터 가져오는 상황
      } else {
        // 만약 데이터가 있는 상황
        // 기존 데이터를 보존한채 api요청
        if (state is CursorPaginationModel && !forceRefetch) {
          final pState = state as CursorPaginationModel;

          state = CursorPaginationRefetching(
            meta: pState.meta,
            data: pState.data,
          );
        } else {
          state = CursorPaginationLoading();
        }
      }

      final response =
          await repository.paginate(paginationParams: paginationParams);

      if (state is CursorPaginationFetchingMore) {
        final pState = state as CursorPaginationFetchingMore;

        state = response.copyWith(data: [
          ...pState.data,
          ...response.data,
        ]);
      } else {
        state = response;
      }
    } catch (e) {
      state = CursorPaginationError(message: '데이터를 가져오지 못했습니다.');
    }
  }

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

    state = pState.copyWith(
      data: pState.data
          .map<RestaurantModel>((e) => e.id == id ? response : e)
          .toList(),
    );
  }
}
