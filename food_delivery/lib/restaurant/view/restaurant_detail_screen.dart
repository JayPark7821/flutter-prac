import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/restaurant/model/restaurant_detail_model.dart';

import '../../common/const/data.dart';
import '../../common/layout/default_layout.dart';
import '../../product/component/product_card.dart';
import '../component/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({Key? key, required this.id}) : super(key: key);

  Future<Map<String, dynamic>> getRestaurantDetail() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    return (await dio.get('http://$ip/restaurant/$id',
            options:
                Options(headers: {'authorization': 'Bearer $accessToken'})))
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '떡볶이',
        child: FutureBuilder<Map<String, dynamic>>(
          future: getRestaurantDetail(),
          builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final item = RestaurantDetailModel.fromJson(
              json: snapshot.data!,
            );
            return CustomScrollView(
              slivers: [
                renderTop(model: item),
                renderLabel(),
                renderProducts(products: item.products),
              ],
            );
          },
        ));
  }

  SliverToBoxAdapter renderTop({required RestaurantDetailModel model}) {
    return SliverToBoxAdapter(
        child: RestaurantCard.fromModel(
      model: model,
      isDetail: true,
    ));
  }

  SliverPadding renderProducts(
      {required List<RestaurantProductModel> products}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ProductCard.fromModel(model: products[index]),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  Widget renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
