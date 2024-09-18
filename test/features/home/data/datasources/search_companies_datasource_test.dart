import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource.dart';
import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

class MockSearchCompaniesDatasource extends Mock implements SearchCompaniesDatasource {}

void main() {
  MockSearchCompaniesDatasource mockDatasource = MockSearchCompaniesDatasource();

  setUp(() {
    mockDatasource = MockSearchCompaniesDatasource();
  });

  test('should return a list of ResultSearchCompaniesModel when the call to datasource is successful', () async {
    // Arrange
    final List<ResultSearchCompaniesModel> tCompaniesList = [
      ResultSearchCompaniesModel(id: '1', name: 'Company 1'),
      ResultSearchCompaniesModel(id: '2', name: 'Company 2'),
    ];
    when(mockDatasource.getCompanies()).thenAnswer((_) async => tCompaniesList);

    // Act
    final result = await mockDatasource.getCompanies();

    // Assert
    expect(result, tCompaniesList);
    verify(mockDatasource.getCompanies());
    verifyNoMoreInteractions(mockDatasource);
  });

  test('should throw an exception when the call to datasource is unsuccessful', () async {
    // Arrange
    when(mockDatasource.getCompanies()).thenThrow(Exception('Failed to load companies'));

    // Act
    final call = mockDatasource.getCompanies;

    // Assert
    expect(() => call(), throwsA(isA<Exception>()));
    verify(mockDatasource.getCompanies());
    verifyNoMoreInteractions(mockDatasource);
  });
}