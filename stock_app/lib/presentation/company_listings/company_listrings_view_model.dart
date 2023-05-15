import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stock_app/domain/repository/stock_repository.dart';
import 'package:stock_app/presentation/company_listings/company_listings_action.dart';

import 'company_listings_state.dart';

class CompanyListingsViewModel with ChangeNotifier {
  final StockRepository _repository;
  CompanyListingsState _state = CompanyListingsState();
  Timer? _debounce;

  CompanyListingsState get state => _state;

  CompanyListingsViewModel(this._repository) {
    _getCompanyListings();
  }

  void onAction(CompanyListingsAction action) {
    action.when(
      refresh: () => _getCompanyListings(fetchFromRemote: true),
      onSearchQueryChange: (query) {
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        } else {}
        _debounce = Timer(const Duration(milliseconds: 300), () {
          _getCompanyListings(query: query);
        });
      },
    );
  }

  Future _getCompanyListings({
    bool fetchFromRemote = false,
    String query = '',
  }) async {
    _state = state.copyWith(
      isLoading: true,
    );

    notifyListeners();

    final result = await _repository.getCompanyListings(fetchFromRemote, query);
    result.when(
      success: (listings) {
        _state = state.copyWith(
          companies: listings,
        );
      },
      error: (e) {
        print('리모트 에러 ' + e.toString());
      },
    );
    _state = state.copyWith(
      isLoading: false,
    );

    notifyListeners();
  }
}
