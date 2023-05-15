import 'package:stock_app/data/source/local/company_listing_entity.dart';

import '../../domain/model/company_info.dart';
import '../../domain/model/company_listing.dart';
import '../source/remote/dto/company_info_dto.dart';

extension ToCompanyListing on CompanyListingEntity {
  CompanyListing toCompanyListing() {
    return CompanyListing(
      symbol: symbol,
      name: name,
      exchange: exchange,
    );
  }
}

extension ToCompanyListingEntity on CompanyListing {
  CompanyListingEntity toCompanyListingEntity() {
    return CompanyListingEntity(
      symbol: symbol,
      name: name,
      exchange: exchange,
    );
  }
}

extension ToCompanyInfo on CompanyInfoDto {
  CompanyInfo toCompanyInfo() {
    return CompanyInfo(
      symbol: symbol ?? '',
      name: name ?? '',
      description: description ?? '',
      country: country ?? '',
      industry: industry ?? '',
    );
  }
}
