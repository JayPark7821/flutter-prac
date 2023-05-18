import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/common/provider/pagination_provider.dart';
import 'package:food_delivery/rating/model/rating_model.dart';

import '../repository/restaurant_rating_repository.dart';

final restaurantRatingProvider = StateNotifierProvider.family<
    RestaurantRatingStateNotifier, CursorPaginationBase, String>((ref, id) {
  final repository = ref.watch(restaurantRatingRepositoryProvider(id));

  return RestaurantRatingStateNotifier(repository: repository);
});

class RestaurantRatingStateNotifier
    extends PaginationProvider<RatingModel, RestaurantRatingRepository> {
  RestaurantRatingStateNotifier({
    required super.repository,
  });
}
