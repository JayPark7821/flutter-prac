import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/utils/pagination_utils.dart';
import 'package:food_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:food_delivery/restaurant/view/restaurant_detail_screen.dart';

import '../../common/model/cursor_pagination_model.dart';
import '../component/restaurant_card.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(restaurantProvider.notifier),
    );
    // if (controller.offset > controller.position.maxScrollExtent - 300) {
    //   ref.read(restaurantProvider.notifier).paginate(fetchMore: true);
    // }
  }

  @override
  Widget build(BuildContext contextef) {
    final data = ref.watch(restaurantProvider);

    // 처음 로딩
    if (data is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    //에러
    if (data is CursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    final cp = data as CursorPaginationModel;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView.separated(
        controller: controller,
        itemBuilder: (_, index) {
          if (index == cp.data.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: data is CursorPaginationFetchingMore
                    ? CircularProgressIndicator()
                    : Text('마지막 데이터 입니다.'),
              ),
            );
          }
          final pItem = cp.data[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                      id: pItem.id,
                    ),
                  ),
                );
              },
              child: RestaurantCard.fromModel(model: pItem));
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: cp.data.length + 1,
      ),
    );
  }
}
