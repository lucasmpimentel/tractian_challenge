import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/assets_view/data/datasources/assets_datasource.dart';
import 'package:tractian_challenge/features/assets_view/data/repository/assets_repository_impl.dart';

class MockAssetsDatasource extends Mock implements AssetsDatasource {}

void main() {
  late AssetsRepositoryImpl repository;
  late MockAssetsDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockAssetsDatasource();
    repository = AssetsRepositoryImpl(mockDatasource);
  });

  group('getLocationsByCompanyId', () {
    const companyId = '123';

    test('should return an exception when the call to datasource is unsuccessful', () async {
      // arrange
      when(mockDatasource.getLocationsByCompanyId(companyId))
          .thenThrow(Exception('Error'));
      // act
      final result = await repository.getLocationsByCompanyId(companyId);
      // assert
      expect(result, Left(isA<Exception>()));
      verify(mockDatasource.getLocationsByCompanyId(companyId));
      verifyNoMoreInteractions(mockDatasource);
    });
  });

  group('getAssetsByCompanyId', () {
    const companyId = '123';

    test('should return an exception when the call to datasource is unsuccessful', () async {
      // arrange
      when(mockDatasource.getAssetsByCompanyId(companyId))
          .thenThrow(Exception('Error'));
      // act
      final result = await repository.getAssetsByCompanyId(companyId);
      // assert
      expect(result, Left(isA<Exception>()));
      verify(mockDatasource.getAssetsByCompanyId(companyId));
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}