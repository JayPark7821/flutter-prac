import 'package:hive/hive.dart';

import 'company_listing_entity.dart';

class StockDao {
  static const companyListing = 'companyListing';

  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntities) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.addAll(companyListingEntities);
  }

  Future<void> clearCompanyListings() async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.clear();
  }

  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    final List<CompanyListingEntity> companyList = box.values.toList();

    return companyList
        .where((company) =>
            company.name.toLowerCase().contains(query.toLowerCase()) ||
            company.symbol == query.toUpperCase())
        .toList();
  }
}
