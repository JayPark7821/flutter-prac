import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/dio/dio.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:food_delivery/restaurant/model/restaurant_model.dart';
import 'package:retrofit/http.dart';

import '../../common/const/data.dart';

part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    return RestaurantRepository(dio, baseUrl: "http://$ip/restaurant");
  },
);

@RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPaginationModel<RestaurantModel>> paginate();

  @GET("/{id}")
  @Headers({'accessToken': 'true'})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path('id') required String id,
  });
}
