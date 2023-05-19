import 'package:flutter/material.dart';
import 'package:food_delivery/common/component/pagination_list_view.dart';
import 'package:food_delivery/product/component/product_card.dart';
import 'package:food_delivery/product/provider/product_provider.dart';

import '../model/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return ProductCard.fromProductModel(model: model);
      },
    );
  }
}
