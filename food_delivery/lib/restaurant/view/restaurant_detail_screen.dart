import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/const/colors.dart';
import 'package:food_delivery/common/model/cursor_pagination_model.dart';
import 'package:food_delivery/product/model/product_model.dart';
import 'package:food_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:food_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:food_delivery/restaurant/provider/restaurant_rating_provider.dart';
import 'package:food_delivery/restaurant/view/basket_screen.dart';
import 'package:food_delivery/user/provider/basket_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletons/skeletons.dart';

import '../../common/layout/default_layout.dart';
import '../../common/utils/pagination_utils.dart';
import '../../product/component/product_card.dart';
import '../../rating/component/rating_card.dart';
import '../../rating/model/rating_model.dart';
import '../component/restaurant_card.dart';
import '../model/restaurant_model.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'restaurantDetail';

  final String id;

  const RestaurantDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
    controller.addListener(listener);
  }

  void listener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(
        restaurantRatingProvider(widget.id).notifier,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(widget.id));
    final ratingState = ref.watch(restaurantRatingProvider(widget.id));
    final basket = ref.watch(basketProvider);

    if (state == null) {
      return const DefaultLayout(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return DefaultLayout(
      title: state.name,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(BasketScreen.routeName);
        },
        backgroundColor: PRIMARY_COLOR,
        child: Badge(
          showBadge: basket.isNotEmpty,
          badgeContent: Text(
            basket
                .fold<int>(
                  0,
                  (previousValue, next) => previousValue + next.count,
                )
                .toString(),
            style: const TextStyle(color: PRIMARY_COLOR, fontSize: 10),
          ),
          badgeStyle: const BadgeStyle(
            badgeColor: Colors.white,
          ),
          child: const Icon(Icons.shopping_basket_outlined),
        ),
      ),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          renderTop(model: state),
          if (state is! RestaurantDetailModel) renderLoading(),
          if (state is RestaurantDetailModel) renderLabel(),
          if (state is RestaurantDetailModel)
            renderProducts(products: state.products, restaurant: state),
          if (ratingState is CursorPaginationModel<RatingModel>)
            renderRatings(models: ratingState.data)
        ],
      ),
    );
  }

  SliverPadding renderRatings({
    required List<RatingModel> models,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RatingCard.fromModel(model: models[index]),
          ),
          childCount: models.length,
        ),
      ),
    );
  }

  SliverPadding renderLoading() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                        lines: 5,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop({required RestaurantModel model}) {
    return SliverToBoxAdapter(
        child: RestaurantCard.fromModel(
      model: model,
      isDetail: true,
    ));
  }

  SliverPadding renderProducts({
    required List<RestaurantProductModel> products,
    required RestaurantModel restaurant,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: () {
                ref.read(basketProvider.notifier).addToBasket(
                        product: ProductModel(
                      id: products[index].id,
                      name: products[index].name,
                      imgUrl: products[index].imgUrl,
                      price: products[index].price,
                      restaurant: restaurant,
                      detail: products[index].detail,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ProductCard.fromRestaurantProductModel(
                    model: products[index]),
              ),
            );
          },
          childCount: products.length,
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
