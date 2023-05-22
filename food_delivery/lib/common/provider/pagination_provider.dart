import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/common/model/model_with_id.dart';

import '../model/pagination_params.dart';
import '../repository/base_pagination_repository.dart';

class _PaginationInfo {
  final int fetchCount;

// 추가로 데이터 더 가져오기
// true - 추가로 데이터 더 가져옴
// false - 새로고침 (현재 상태를 덮어씌움)
  final bool fetchMore;

// 강제로 다시 로딩
// true - CurcorPaginationLoading()
  final bool forceRefetch;

  _PaginationInfo({
    this.fetchCount = 20,
    this.fetchMore = false,
    this.forceRefetch = false,
  });
}

class PaginationProvider<T extends IModelWithId,
        U extends IBasePaginationRepository<T>>
    extends StateNotifier<CursorPaginationBase> {
  final U repository;
  final paginationThrottle = Throttle(
    Duration(seconds: 1),
    initialValue: _PaginationInfo(),
    checkEquality: false,
  );

  PaginationProvider({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    paginate();
    paginationThrottle.values.listen(
      (state) {
        _throttledPagination(state);
      },
    );
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
    paginationThrottle.setValue(_PaginationInfo(
      fetchMore: fetchMore,
      fetchCount: fetchCount,
      forceRefetch: forceRefetch,
    ));
  }

  _throttledPagination(_PaginationInfo info) async {
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
      if (state is CursorPaginationModel && !info.forceRefetch) {
        final pState = state as CursorPaginationModel;
        if (!pState.meta.hasMore) {
          return;
        }
      }
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (info.fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      PaginationParams paginationParams = PaginationParams(
        count: info.fetchCount,
      );

      //fetchMore 데이터를 추가로 더 가져오는 상황
      if (info.fetchMore) {
        final pState = state as CursorPaginationModel<T>;
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
        if (state is CursorPaginationModel && !info.forceRefetch) {
          final pState = state as CursorPaginationModel<T>;

          state = CursorPaginationRefetching<T>(
            meta: pState.meta,
            data: pState.data,
          );
        } else {
          state = CursorPaginationLoading();
        }
      }

      final response =
          await repository.paginate(paginationParams: paginationParams);

      if (state is CursorPaginationFetchingMore<T>) {
        final pState = state as CursorPaginationFetchingMore<T>;

        state = response.copyWith(data: [
          ...pState.data,
          ...response.data,
        ]);
      } else {
        state = response;
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      state = CursorPaginationError(message: '데이터를 가져오지 못했습니다.');
    }
  }
}
