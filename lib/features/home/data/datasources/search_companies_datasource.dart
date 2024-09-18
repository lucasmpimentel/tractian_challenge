import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

abstract class SearchCompaniesDatasource {
  Future<List<ResultSearchCompaniesModel>> getCompanies();
}
