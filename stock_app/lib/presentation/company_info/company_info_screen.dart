import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/presentation/company_info/company_info_view_model.dart';

import '../../domain/model/company_info.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyInfoViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (state.errorMsg != null)
              Center(
                child: Text(state.errorMsg!),
              ),
            if (state.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state.isLoading == false && state.errorMsg == null)
              _buildBody(state.companyInfo!),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(CompanyInfo companyInfo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyInfo.name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            companyInfo.symbol,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          const Divider(),
          Text(
            "Industry: ${companyInfo.industry}",
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "Country: ${companyInfo.country}",
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          Text(
            companyInfo.description,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
