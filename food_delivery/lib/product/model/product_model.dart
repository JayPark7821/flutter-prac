import 'package:food_delivery/common/model/model_with_id.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/data_utils.dart';
import '../../restaurant/model/restaurant_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel implements IModelWithId {
  final String id;
  final String name;
  @JsonKey(fromJson: DataUtils.pathToUrl)
  final String imgUrl;
  final int price;
  final RestaurantModel restaurant;
  final String detail;

  ProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.restaurant,
    required this.detail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
