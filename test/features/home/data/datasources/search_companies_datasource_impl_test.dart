import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource_impl.dart';
import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late SearchCompaniesDatasourceImpl datasource;
  late MockDio mockDio;
  const url = 'https://fake-api.tractian.com/companies';

  setUpAll(() {
    mockDio = MockDio();
    datasource = SearchCompaniesDatasourceImpl(mockDio);
  });

  group('getCompanies', () {
    test('should return a list of ResultSearchCompaniesModel when the response code is 200', () async {
      // arrange
      final responsePayload = [
        {
          'id': 1,
          'name': 'Company 1',
        },
        {
          'id': 2,
          'name': 'Company 2',
        },
      ];
      when(mockDio.get(url)).thenAnswer((_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // act
      final result = await datasource.getCompanies();

      // assert
      expect(result, isA<List<ResultSearchCompaniesModel>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].name, 'Company 1');
    });

    test('should throw an exception when the response code is not 200', () async {
      // arrange
      when(mockDio.get(url)).thenAnswer((_) async => Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''),
          ));

      // act
      final call = datasource.getCompanies();

      // assert
      expect(() => call, throwsA(isA<Exception>()));
    });
  });
}
