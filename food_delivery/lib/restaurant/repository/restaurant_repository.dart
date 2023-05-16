import 'package:dio/dio.dart';
import 'package:food_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:retrofit/http.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  //
  // @GET('/')
  // pagenate();

  @GET("/{id}")
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path('id') required String id,
  });
}
