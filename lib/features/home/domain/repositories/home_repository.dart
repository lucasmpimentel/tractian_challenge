import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<ResultCompany>>> getCompanies();
}
