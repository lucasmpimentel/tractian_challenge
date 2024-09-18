import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';

// Mock class for HomeRepository
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  MockHomeRepository mockHomeRepository = MockHomeRepository();

  setUpAll(() {
    mockHomeRepository = MockHomeRepository();
  });

  group('HomeRepository Tests', () {
    final List<ResultCompany> tCompanies = [
      ResultCompany(id: '1', name: 'Company 1'),
      ResultCompany(id: '2', name: 'Company 2'),
    ];

    test('should return a list of companies when the call to repository is successful', () async {
      // Arrange
      when(mockHomeRepository.getCompanies())
          .thenAnswer((_) async => Right(tCompanies));

      // Act
      final result = await mockHomeRepository.getCompanies();

      // Assert
      expect(result, Right(tCompanies));
      verify(mockHomeRepository.getCompanies());
      verifyNoMoreInteractions(mockHomeRepository);
    });

    test('should return an exception when the call to repository is unsuccessful', () async {
      // Arrange
      final tException = Exception('Failed to load companies');
      when(mockHomeRepository.getCompanies())
          .thenAnswer((_) async => Left(tException));

      // Act
      final result = await mockHomeRepository.getCompanies();

      // Assert
      expect(result, Left(tException));
      verify(mockHomeRepository.getCompanies());
      verifyNoMoreInteractions(mockHomeRepository);
    });
  });
}