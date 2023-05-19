import 'package:flutter/material.dart';
import 'package:food_delivery/common/component/pagination_list_view.dart';
import 'package:food_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:food_delivery/restaurant/view/restaurant_detail_screen.dart';

import '../component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(
                    id: model.id,
                  ),
                ),
              );
            },
            child: RestaurantCard.fromModel(model: model));
      },
    );
  }
}
