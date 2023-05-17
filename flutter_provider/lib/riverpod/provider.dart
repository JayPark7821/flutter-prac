import 'package:flutter_provider/model/shopping_item_model.dart';
import 'package:flutter_provider/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredShoppingList = Provider<List<ShoppingItemModel>>(
    // (ref) => ref.watch(shoppingListProvider),
    (ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);
  if (filterState == FilterState.all) {
    return shoppingListState;
  }
  return shoppingListState
      .where(
        (element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy,
      )
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
