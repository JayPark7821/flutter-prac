import 'package:hive/hive.dart';

import 'company_listing_entity.dart';

class StockDao {
  static const companyListing = 'companyListing';

  final box = Hive.box('stock.db');

  Future<void> insertCompanyListrings(
      List<CompanyListingEntity> companyListingEntity) async {
    await box.put(companyListing, companyListingEntity);
  }

  Future<void> clearCompanyListrings() async {
    await box.clear();
  }

  Future<List<CompanyListingEntity>> searchCompanyListring(String query) async {
    final List<CompanyListingEntity> companyList =
        box.get(companyListing, defaultValue: <CompanyListingEntity>[]);

    return companyList
        .where((company) =>
            company.name.toLowerCase().contains(query.toLowerCase()) ||
            company.symbol == query.toUpperCase())
        .toList();
  }
}
