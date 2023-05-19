import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/common/provider/pagination_provider.dart';
import 'package:food_delivery/product/repository/product_repository.dart';

import '../../common/model/cursor_pagination_model.dart';
import '../model/product_model.dart';

final productProvider =
    StateNotifierProvider<ProductSateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductSateNotifier(repository: repository);
});

class ProductSateNotifier
    extends PaginationProvider<ProductModel, ProductRepository> {
  ProductSateNotifier({required super.repository});
}
