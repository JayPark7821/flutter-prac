import '../../util/result.dart';
import '../model/company_listing.dart';

abstract class StockRepository {
  Future<Result<List<CompanyListing>>> getCompanyListings(
    bool fetchFromRemote,
    String query,
  );
}
