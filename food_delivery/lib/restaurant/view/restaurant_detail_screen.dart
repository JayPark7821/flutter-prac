import 'package:flutter/material.dart';
import 'package:food_delivery/common/layout/default_layout.dart';
import 'package:food_delivery/restaurant/component/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '떡볶이',
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
            name: "test",
            tags: ["test"],
            ratingsCount: 12,
            deliveryTime: 12,
            deliveryFee: 12,
            ratings: 12,
            isDetail: true,
            detail: "테스트 디테일",
          )
        ],
      ),
    );
  }
}
