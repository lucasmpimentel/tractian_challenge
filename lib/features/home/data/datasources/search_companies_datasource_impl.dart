import 'package:dio/dio.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource.dart';
import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

class SearchCompaniesDatasourceImpl implements SearchCompaniesDatasource {
  final Dio dio;

  SearchCompaniesDatasourceImpl(this.dio);

  @override
  Future<List<ResultSearchCompaniesModel>> getCompanies() async {
    const url = 'https://fake-api.tractian.com/companies';
    final response = await dio.get(url);
    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar empresas');
    }
    final result = (response.data as List).map((e) => ResultSearchCompaniesModel.fromJson(e)).toList();
    return result;
  }
}
