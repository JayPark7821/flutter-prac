import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/user/model/basket_item_model.dart';
import 'package:food_delivery/user/model/patch_basket_body.dart';

import '../../product/model/product_model.dart';
import '../repository/user_me_repository.dart';

final basketProvider =
    StateNotifierProvider<BasketProvider, List<BasketItemModel>>((ref) {
  return BasketProvider(userMeRepository: ref.watch(userMeRepositoryProvider));
});

class BasketProvider extends StateNotifier<List<BasketItemModel>> {
  final UserMeRepository userMeRepository;

  BasketProvider({
    required this.userMeRepository,
  }) : super([]);

  Future<void> patchBasket() async {
    await userMeRepository.patchBasket(
      body: PatchBasketBody(
        basket: state
            .map(
              (e) => PatchBasketBodyBasket(
                  productId: e.product.id, count: e.count),
            )
            .toList(),
      ),
    );
  }

  Future<void> addToBasket({
    required ProductModel product,
  }) async {
    final exists =
        state.firstWhereOrNull((e) => e.product.id == product.id) != null;

    if (exists) {
      state = state
          .map((e) =>
              e.product.id == product.id ? e.copyWith(count: e.count + 1) : e)
          .toList();
    } else {
      state = [
        ...state,
        BasketItemModel(
          product: product,
          count: 1,
        ),
      ];
    }
    await patchBasket();
  }

  Future<void> removeBasket({
    required ProductModel product,
    bool isDelete = false,
  }) async {
    final exists =
        state.firstWhereOrNull((e) => e.product.id == product.id) != null;

    if (!exists) {
      return;
    } else {
      final existingProduct =
          state.firstWhere((e) => e.product.id == product.id);

      if (existingProduct.count == 1 || isDelete) {
        state = state
            .where(
              (e) => e.product.id != product.id,
            )
            .toList();
      } else {
        state = state
            .map((e) =>
                e.product.id == product.id ? e.copyWith(count: e.count - 1) : e)
            .toList();
      }
    }
    await patchBasket();
  }
}
