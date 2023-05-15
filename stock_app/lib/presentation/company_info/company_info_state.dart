import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/company_info.dart';
import '../../domain/model/intraday_info.dart';

part 'company_info_state.freezed.dart';
part 'company_info_state.g.dart';

@freezed
class CompanyInfoState with _$CompanyInfoState {
  factory CompanyInfoState({
    CompanyInfo? companyInfo,
    @Default(false) bool isLoading,
    String? errorMsg,
    @Default([]) List<IntradayInfo> stockInfos,
  }) = _CompanyInfoState;

  factory CompanyInfoState.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoStateFromJson(json);
}
