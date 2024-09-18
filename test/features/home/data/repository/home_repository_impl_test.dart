import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource.dart';
import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';
import 'package:tractian_challenge/features/home/data/repository/home_repository_impl.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

class MockSearchCompaniesDatasource extends Mock implements SearchCompaniesDatasource {}

void main() {
  late HomeRepositoryImpl repository;
  late MockSearchCompaniesDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockSearchCompaniesDatasource();
    repository = HomeRepositoryImpl(mockDatasource);
  });

  test('should return list of ResultCompany when the call to datasource is successful', () async {
    // arrange
    final companies = [ResultSearchCompaniesModel(id: '1', name: 'Company 1')];
    when(mockDatasource.getCompanies()).thenAnswer((_) async => Future.value(companies));

    // act
    final result = await repository.getCompanies();

    // assert
    expect(result, Right(companies));
    verify(mockDatasource.getCompanies());
    verifyNoMoreInteractions(mockDatasource);
  });

  test('should return an Exception when the call to datasource is unsuccessful', () async {
    // arrange
    when(mockDatasource.getCompanies()).thenThrow(Exception('Failed to fetch companies'));

    // act
    final result = await repository.getCompanies();

    // assert
    expect(result, Left(isA<Exception>()));
    verify(mockDatasource.getCompanies());
    verifyNoMoreInteractions(mockDatasource);
  });
}