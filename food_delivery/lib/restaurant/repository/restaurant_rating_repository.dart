import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/const/data.dart';
import 'package:food_delivery/common/dio/dio.dart';
import 'package:food_delivery/rating/model/rating_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/model/cursor_pagination_model.dart';
import '../../common/model/pagination_params.dart';
import '../../common/repository/base_pagination_repository.dart';

part 'restaurant_rating_repository.g.dart';

final restaurantRatingRepositoryProvider =
    Provider.family<RestaurantRatingRepository, String>((ref, id) {
  final dio = ref.watch(dioProvider);

  return RestaurantRatingRepository(dio,
      baseUrl: 'http://$ip/restaurant/$id/rating');
});

@RestApi()
abstract class RestaurantRatingRepository
    implements IBasePaginationRepository<RatingModel> {
  factory RestaurantRatingRepository(Dio dio, {String baseUrl}) =
      _RestaurantRatingRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPaginationModel<RatingModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
