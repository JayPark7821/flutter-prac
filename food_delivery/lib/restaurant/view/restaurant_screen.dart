import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/restaurant/model/restaurant_model.dart';

import '../../common/const/data.dart';
import '../component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> pagenateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: FutureBuilder(
            future: pagenateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return ListView.separated(
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final pItem = RestaurantModel.fromJson(json: item);
                  return RestaurantCard.fromModel(model: pItem);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
