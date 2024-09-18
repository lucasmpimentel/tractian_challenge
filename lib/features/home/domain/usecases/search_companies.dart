import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';

abstract class SearchCompanies {
  Future<Either<Exception, List<ResultCompany>>> call();
}

class SearchCompaniesImpl implements SearchCompanies {
  final HomeRepository repository;

  SearchCompaniesImpl({required this.repository});

  @override
  Future<Either<Exception, List<ResultCompany>>> call() async {
    return repository.getCompanies();
  }
}
