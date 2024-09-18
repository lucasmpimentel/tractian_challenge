import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final SearchCompaniesDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, List<ResultCompany>>> getCompanies() async {
    try {
      final result = await datasource.getCompanies();
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
